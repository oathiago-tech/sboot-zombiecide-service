package br.com.tao.application.service.match;

import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.repository.MatchJpaRepository;
import br.com.tao.adapter.out.persistence.matchevents.entity.MatchEventEntity;
import br.com.tao.adapter.out.persistence.matchevents.repository.MatchEventJpaRepository;
import br.com.tao.application.service.enumeration.DangerLevelEnum;
import br.com.tao.application.service.enumeration.EventTypeEnum;
import br.com.tao.application.service.enumeration.TurnPhase;
import br.com.tao.application.service.enumeration.ZombieTypeEnum;
import br.com.tao.application.service.nfc.domain.EventResponseDomain;
import br.com.tao.application.service.utils.ZombieAutoSpawnCalculator;
import br.com.tao.application.service.utils.ZombieTurnActionPlanner;
import br.com.tao.domain.match.model.Match;
import br.com.tao.domain.match.model.MatchPlayer;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.OffsetDateTime;
import java.util.Collections;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AdvanceTurnService {

      private final MatchJpaRepository matchJpaRepository;
      private final MatchEventJpaRepository matchEventJpaRepository;
      private final ObjectMapper objectMapper;

      @Transactional
      public Match nextTurn() {
            MatchEntity match = matchJpaRepository.findActiveWithPlayersForUpdate()
                  .orElseThrow(() -> new IllegalStateException("No active match"));

            int playerCount = match.getPlayers() == null ? 0 : match.getPlayers().size();
            if (playerCount < 1) {
                  throw new IllegalStateException("Active match has no players");
            }

            if (match.getTurnPhase() == TurnPhase.PLAYER) {
                  nextPlauerTurn(match, playerCount);
            } else {
                  nextZombieTurn(playerCount, match);
            }

            MatchEntity saved = matchJpaRepository.save(match);

            String currentPlayerId = saved.getTurnPhase() != TurnPhase.PLAYER ? null : (saved.getCurrentTurnIndex() == null ? null : (saved.getPlayers() == null || saved.getPlayers()
                  .isEmpty() ? null : saved.getPlayers().get(saved.getCurrentTurnIndex()).getId().toString()));

            var payload = new EventResponseDomain(null, null, null, null, null, null, null,
                  saved.getTurnPhase(), OffsetDateTime.now(), null,
                  EventTypeEnum.TURN_STARTED);

            matchEventJpaRepository.save(
                  MatchEventEntity.builder().eventType(EventTypeEnum.TURN_STARTED)
                        .actor(null).tagUid(null)
                        .payload(objectMapper.valueToTree(payload)).createdAt(OffsetDateTime.now()).match(match).build());

            return returnMatch(saved, currentPlayerId);
      }

      private static Match returnMatch(MatchEntity saved, String currentPlayerId) {
            return Match.builder().id(saved.getId().toString()).campaignName(saved.getCampaignName())
                  .difficulty(saved.getDifficulty().name()).active(Boolean.TRUE.equals(saved.getActive()))
                  .createdAt(saved.getCreatedAt()).players(
                        saved.getPlayers() == null ? Collections.emptyList() : saved.getPlayers().stream()
                              .map(p -> MatchPlayer.builder().id(p.getId() == null ? null : p.getId().toString())
                                    .name(p.getName())
                                    .character(p.getCharacter() == null ? null : p.getCharacter().name())
                                    .life(p.getLife()).level(p.getLevel()).zombiesKill(p.getZombiesKill()).build())
                              .toList()).turnPhase(saved.getTurnPhase() == null ? null : saved.getTurnPhase().name())
                  .currentPlayerId(currentPlayerId).currentTurnIndex(saved.getCurrentTurnIndex())
                  .activeWalkers(saved.getActiveWalkers()).activeRunners(saved.getActiveRunners())
                  .activeFaties(saved.getActiveFaties()).activeAbomination(saved.getActiveAbomination()).build();
      }

      private void nextZombieTurn(int playerCount, MatchEntity match) {
            int firstAliveIdx = -1;
            for(int i = 0; i < playerCount; i++) {
                  Integer life = match.getPlayers().get(i).getLife();
                  if (life != null && life > 0) {
                        firstAliveIdx = i;
                        break;
                  }
            }

            if (firstAliveIdx >= 0
                  && Boolean.TRUE.equals(match.getAutomaticSpawn())
                  && match.getSpawnsAmount() != null
                  && match.getSpawnsAmount() > 0) {

                  boolean keepZombieTurn = applyAutomaticZombieActions(match);

                  if (keepZombieTurn) {
                        match.setTurnPhase(TurnPhase.ZOMBIE);
                        match.setCurrentTurnIndex(0);
                        return;
                  }
            }

            if (firstAliveIdx >= 0) {
                  match.setTurnPhase(TurnPhase.PLAYER);
                  match.setCurrentTurnIndex(firstAliveIdx);
            } else {
                  match.setTurnPhase(TurnPhase.ZOMBIE);
                  match.setCurrentTurnIndex(0);
            }
      }

      private boolean applyAutomaticZombieActions(MatchEntity match) {
            int alivePlayers = (int) match.getPlayers().stream()
                  .filter(p -> p.getLife() != null && p.getLife() > 0)
                  .count();

            if (alivePlayers == 0) {
                  return false;
            }

            int safeMaxLevel = matchJpaRepository.findHighestPlayerLevel(match.getId());

            final DangerLevelEnum dangerLevel =
                  safeMaxLevel < 7 ? DangerLevelEnum.BLUE :
                        safeMaxLevel < 19 ? DangerLevelEnum.YELLOW :
                              safeMaxLevel < 43 ? DangerLevelEnum.ORANGE :
                                    DangerLevelEnum.RED;

            int actions = Math.max(1, match.getSpawnsAmount());
            boolean extraTurnTriggered = false;

            for (int actionIndex = 0; actionIndex < actions; actionIndex++) {
                  if (!extraTurnTriggered && ZombieTurnActionPlanner.shouldTriggerExtraTurn(
                        match.getId(),
                        match.getCurrentTurnIndex(),
                        actionIndex,
                        actions,
                        alivePlayers,
                        match.getDifficulty(),
                        dangerLevel
                  )) {
                        registerZombieExtraTurnEvent(match, dangerLevel);
                        extraTurnTriggered = true;
                        continue;
                  }

                  applyAutomaticSpawnAction(match, alivePlayers, dangerLevel);
            }
            return extraTurnTriggered;
      }

      private void applyAutomaticSpawnAction(MatchEntity match, int alivePlayers, DangerLevelEnum dangerLevel) {
            // 1 ação de spawn => baseSpawnsAmount = 1 (equilíbrio: actions controla o "quanto" no total)
            Map<ZombieTypeEnum, Integer> spawnPlan = ZombieAutoSpawnCalculator.calculate(
                  alivePlayers,
                  match.getDifficulty(),
                  dangerLevel,
                  1
            );

            OffsetDateTime now = OffsetDateTime.now();

            for (var entry : spawnPlan.entrySet()) {
                  ZombieTypeEnum type = entry.getKey();
                  Integer amount = entry.getValue();

                  if (amount == null || amount <= 0) {
                        continue;
                  }

                  switch (type) {
                        case WALKERS -> match.setActiveWalkers(match.getActiveWalkers() + amount);
                        case RUNNERS -> match.setActiveRunners(match.getActiveRunners() + amount);
                        case FATIES -> match.setActiveFaties(match.getActiveFaties() + amount);
                        case ABOMINATION -> match.setActiveAbomination(match.getActiveAbomination() + amount);
                  }

                  var payload = new EventResponseDomain(
                        dangerLevel,
                        null,
                        amount,
                        0,
                        type,
                        null,
                        null,
                        TurnPhase.ZOMBIE,
                        now,
                        null,
                        EventTypeEnum.ZOMBIE_SCANNED
                  );

                  matchEventJpaRepository.save(
                        MatchEventEntity.builder()
                              .eventType(EventTypeEnum.ZOMBIE_SCANNED)
                              .actor(null)
                              .tagUid(null)
                              .payload(objectMapper.valueToTree(payload))
                              .createdAt(now)
                              .match(match)
                              .build()
                  );
            }
      }

      private void registerZombieExtraTurnEvent(MatchEntity match, DangerLevelEnum dangerLevel) {
            OffsetDateTime now = OffsetDateTime.now();

            var payload = new EventResponseDomain(
                  dangerLevel,
                  null,
                  null,
                  0,
                  null,
                  null,
                  null,
                  TurnPhase.ZOMBIE,
                  now,
                  null,
                  EventTypeEnum.ZOMBIE_EXTRA_TURN
            );

            matchEventJpaRepository.save(
                  MatchEventEntity.builder()
                        .eventType(EventTypeEnum.ZOMBIE_EXTRA_TURN)
                        .actor(null)
                        .tagUid(null)
                        .payload(objectMapper.valueToTree(payload))
                        .createdAt(now)
                        .match(match)
                        .build()
            );
      }

      private static void nextPlauerTurn(MatchEntity match, int playerCount) {
            int startIdx = match.getCurrentTurnIndex() == null ? 0 : match.getCurrentTurnIndex();
            int nextAliveIdx = -1;

            for(int i = startIdx + 1; i < playerCount; i++) {
                  Integer life = match.getPlayers().get(i).getLife();
                  if (life != null && life > 0) {
                        nextAliveIdx = i;
                        break;
                  }
            }

            if (nextAliveIdx >= 0) {
                  match.setCurrentTurnIndex(nextAliveIdx);
            } else {
                  match.setTurnPhase(TurnPhase.ZOMBIE);
                  match.setCurrentTurnIndex(0);
            }
      }
}