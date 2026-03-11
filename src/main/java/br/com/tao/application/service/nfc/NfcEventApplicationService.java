package br.com.tao.application.service.nfc;

import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.entity.MatchPlayerEntity;
import br.com.tao.adapter.out.persistence.match.repository.MatchJpaRepository;
import br.com.tao.adapter.out.persistence.match.repository.MatchPlayerJpaRepository;
import br.com.tao.adapter.out.persistence.matchevents.entity.MatchEventEntity;
import br.com.tao.adapter.out.persistence.matchevents.repository.MatchEventJpaRepository;
import br.com.tao.adapter.out.persistence.tag.entity.TagEntity;
import br.com.tao.adapter.out.persistence.tag.repository.TagJpaRepository;
import br.com.tao.application.service.enumeration.*;
import br.com.tao.application.service.nfc.domain.EventResponseDomain;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.OffsetDateTime;
import java.util.Comparator;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class NfcEventApplicationService {

      private final MatchJpaRepository matchJpaRepository;
      private final TagJpaRepository tagJpaRepository;
      private final MatchEventJpaRepository matchEventJpaRepository;
      private final ObjectMapper objectMapper;
      private final MatchPlayerJpaRepository matchPlayerJpaRepository;
      ;

      @Transactional
      public EventResponseDomain applyNfcEvent(String tagUid) {
            makeValidations result = getMakeValidations(tagUid);
            var maxLevel = matchJpaRepository.findHighestPlayerLevel(result.match.getId());
            final DangerLevelEnum dangerLevel = maxLevel < 7 ? DangerLevelEnum.BLUE : maxLevel < 19 ?
                  DangerLevelEnum.YELLOW : maxLevel < 43 ? DangerLevelEnum.ORANGE : DangerLevelEnum.RED;
            if (result.match().getTurnPhase() == TurnPhase.ZOMBIE) {
                  return processZombiesEvent(result.match(), result.tag(), dangerLevel);
            } else {
                  return processPlayerEvent(result.match(), result.tag(), dangerLevel);
            }
      }

      private makeValidations getMakeValidations(String tagUid) {
            if (tagUid == null || tagUid.isBlank()) {
                  throw new IllegalArgumentException("tagUid is required");
            }

            TagEntity tag = tagJpaRepository.findByTagUid(tagUid).filter(t -> Boolean.TRUE.equals(t.getActive()))
                  .orElseThrow(() -> new IllegalArgumentException("Tag not found or inactive: " + tagUid));

            MatchEntity match = matchJpaRepository.findActiveWithPlayersForUpdate()
                  .orElseThrow(() -> new IllegalStateException("No active match"));

            makeValidations result = new makeValidations(tag, match);
            return result;
      }

      private record makeValidations(TagEntity tag, MatchEntity match) {
      }

      private EventResponseDomain processZombiesEvent(MatchEntity match, TagEntity tag, DangerLevelEnum dangerLevel) {
            if (match.getTurnPhase() == TurnPhase.ZOMBIE) {

                  if (tag.getZombie() == null) {
                        if (tag.getPlayerCharacter() != null) {
                              MatchPlayerEntity target = getPlayersInStableOrder(match).stream()
                                    .filter(p -> p.getCharacter() == tag.getPlayerCharacter())
                                    .findFirst()
                                    .orElseThrow(() -> new IllegalArgumentException(
                                          "Player not found in active match for character=" + tag.getPlayerCharacter()));

                              target.setLife(target.getLife() - 1);
                              matchPlayerJpaRepository.save(target);

                              var payload = new EventResponseDomain(null, null, null, null, null, null, null,
                                    TurnPhase.ZOMBIE, OffsetDateTime.now(), tag.getPlayerCharacter().name(),
                                    EventTypeEnum.DAMAGE_ASSIGNED);

                              matchEventJpaRepository.save(
                                    MatchEventEntity.builder().eventType(EventTypeEnum.DAMAGE_ASSIGNED)
                                          .actor(getMatchPlayerEntity(match)).tagUid(tag.getTagUid())
                                          .payload(objectMapper.valueToTree(payload)).createdAt(OffsetDateTime.now()).match(match).build());

                              return payload;
                        }
                  } else {
                        var zombieEvent = tag.getZombie().getZombieRespawns().stream()
                              .filter(z -> z.getDangerLevel() == dangerLevel).findFirst().orElse(null);

                        var z = tag.getZombie();

                        EventResponseDomain payload = zombieEvent == null ? null : new EventResponseDomain(
                              zombieEvent.getDangerLevel(), zombieEvent.getSpawnPointType(), zombieEvent.getAmount(),
                              zombieEvent.getExecutionOrder(), zombieEvent.getType(), z.getKey(), z.getName(),
                        TurnPhase.ZOMBIE, OffsetDateTime.now(), null, EventTypeEnum.ZOMBIE_CARD_SCANNED);

                        OffsetDateTime now = OffsetDateTime.now();

                        matchEventJpaRepository.save(
                              MatchEventEntity.builder().eventType(EventTypeEnum.ZOMBIE_CARD_SCANNED)
                                    .actor(getMatchPlayerEntity(match)).tagUid(tag.getTagUid())
                                    .payload(objectMapper.valueToTree(payload)).createdAt(now).match(match).build());

                        if (zombieEvent != null) {
                              if (zombieEvent.getSpawnPointType() != SpawnPointTypeEnum.EXTRA_ZOMBIE_TURN) {
                                    switch (zombieEvent.getType()) {
                                          case WALKERS -> match.setActiveWalkers(
                                                match.getActiveWalkers() + zombieEvent.getAmount());
                                          case RUNNERS -> match.setActiveRunners(
                                                match.getActiveRunners() + zombieEvent.getAmount());
                                          case FATIES -> {
                                                match.setActiveFaties(
                                                      match.getActiveFaties() + zombieEvent.getAmount());
                                                match.setActiveWalkers(match.getActiveWalkers() + 2);
                                          }
                                          case ABOMINATION -> match.setActiveAbomination(
                                                match.getActiveAbomination() + zombieEvent.getAmount());
                                    }
                              }
                              matchJpaRepository.save(match);
                              return payload;
                        }
                  }
            }
            return null;
      }

      private EventResponseDomain processPlayerEvent(MatchEntity match, TagEntity tag, DangerLevelEnum dangerLevel) {
            MatchPlayerEntity actor = getMatchPlayerEntity(match);
            TagTypeEnum tagType = tag.getTagType();
            EventResponseDomain payload = null;

            switch (tagType) {
                  case ITEMS_CARD -> {
                        log.info("ITEM CARD SCANNED: {}", tag.getTagUid());
                  }
                  case MISSION_OBJECTIVE -> actor.setLevel(actor.getLevel() + 5);
                  case ZOMBIE -> {
                        killZombies(match, tag, actor);
                        matchJpaRepository.save(match);
                        payload = new EventResponseDomain(dangerLevel, null, 1, 0, tag.getZombieType(), null, null,
                              TurnPhase.PLAYER, OffsetDateTime.now(), actor.getCharacter().name(),
                              EventTypeEnum.ZOMBIE_KILL);

                        matchEventJpaRepository.save(
                              MatchEventEntity.builder().eventType(EventTypeEnum.ZOMBIE_KILL)
                                    .actor(getMatchPlayerEntity(match)).tagUid(tag.getTagUid())
                                    .payload(objectMapper.valueToTree(payload)).createdAt(OffsetDateTime.now()).match(match).build());
                  }
                  case PLAYER -> {
                        MatchPlayerEntity target = getPlayersInStableOrder(match).stream()
                              .filter(p -> p.getCharacter() == tag.getPlayerCharacter())
                              .findFirst()
                              .orElseThrow(() -> new IllegalArgumentException(
                                    "Player not found in active match for character=" + tag.getPlayerCharacter()));

                        target.setLife(target.getLife() + 1);
                        matchPlayerJpaRepository.save(target);

                        payload = new EventResponseDomain(null, null, null, null, null, null, null,
                              TurnPhase.PLAYER, OffsetDateTime.now(), tag.getPlayerCharacter().name(),
                              EventTypeEnum.DAMAGE_REVERTED);

                        matchEventJpaRepository.save(
                              MatchEventEntity.builder().eventType(EventTypeEnum.DAMAGE_REVERTED)
                                    .actor(getMatchPlayerEntity(match)).tagUid(tag.getTagUid())
                                    .payload(objectMapper.valueToTree(payload)).createdAt(OffsetDateTime.now()).match(match).build());
                  }
                  default -> throw new IllegalArgumentException("Unsupported tagType: " + tagType);
            }

            matchPlayerJpaRepository.save(actor);

            return payload;
      }

      private static void killZombies(MatchEntity match, TagEntity tag, MatchPlayerEntity actor) {
            actor.setZombiesKill(actor.getZombiesKill() + 1);
            actor.setLevel(actor.getLevel() + 1);
            if (tag.getZombieType()== ZombieTypeEnum.WALKERS) {
                  match.setActiveWalkers(match.getActiveWalkers() - 1);
            } else if (tag.getZombieType() == ZombieTypeEnum.RUNNERS) {
                  match.setActiveRunners(match.getActiveRunners() - 1);
            } else if (tag.getZombieType() == ZombieTypeEnum.FATIES) {
                  match.setActiveFaties(match.getActiveFaties() - 1);
            } else if (tag.getZombieType() == ZombieTypeEnum.ABOMINATION) {
                  match.setActiveAbomination(match.getActiveAbomination() - 1);
            }
      }

      private static MatchPlayerEntity getMatchPlayerEntity(MatchEntity match) {
            int idx = match.getCurrentTurnIndex() == null ? 0 : match.getCurrentTurnIndex();
            List<MatchPlayerEntity> orderedPlayers = getPlayersInStableOrder(match);

            if (idx < 0 || idx >= orderedPlayers.size()) {
                  throw new IllegalStateException(
                        "Invalid currentTurnIndex=" + idx + " for players=" + orderedPlayers.size());
            }

            return orderedPlayers.get(idx);
      }

      private static List<MatchPlayerEntity> getPlayersInStableOrder(MatchEntity match) {
            if (match.getPlayers() == null || match.getPlayers().isEmpty()) {
                  throw new IllegalStateException("Active match has no players");
            }

            // Garante ordem determinística para que o currentTurnIndex aponte sempre para o mesmo jogador,
            // independentemente de como o JPA retornar a coleção após saves/flush.
            return match.getPlayers().stream()
                  .sorted(Comparator
                        .comparing((MatchPlayerEntity p) -> p.getCharacter() == null ? "" : p.getCharacter().name())
                        .thenComparing(p -> p.getId() == null ? "" : p.getId().toString()))
                  .toList();
      }

      public EventResponseDomain getLastEvent() {
            var event = matchEventJpaRepository.findFirstByOrderByCreatedAtDesc().orElse(null);
            try {
                  if (event != null) return objectMapper.treeToValue(event.getPayload(), EventResponseDomain.class);
                  return null;
            } catch (JsonProcessingException e) {
                  throw new IllegalArgumentException("Invalid payload JSON for event " + event.getId(), e);
            }
      }
}