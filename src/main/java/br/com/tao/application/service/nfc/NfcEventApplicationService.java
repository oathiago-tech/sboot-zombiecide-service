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
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.OffsetDateTime;

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
            if (tagUid == null || tagUid.isBlank()) {
                  throw new IllegalArgumentException("tagUid is required");
            }

            TagEntity tag = tagJpaRepository.findByTagUid(tagUid).filter(t -> Boolean.TRUE.equals(t.getActive()))
                  .orElseThrow(() -> new IllegalArgumentException("Tag not found or inactive: " + tagUid));

            MatchEntity match = matchJpaRepository.findActiveWithPlayersForUpdate()
                  .orElseThrow(() -> new IllegalStateException("No active match"));

            if (match.getTurnPhase() == TurnPhase.PLAYER && tag.getTagType() == TagTypeEnum.ZOMBIE_CARD) {
                  log.warn("SKIPPING ZOMBIE CARD FOR NON-PLAYER TURN");
                  throw new IllegalArgumentException("Zombie card cannot be scanned during PLAYER phase");
            } else if (match.getTurnPhase() == TurnPhase.ZOMBIE && tag.getTagType() == TagTypeEnum.PLAYER) {
                  log.warn("SKIPPING PLAYER CARD FOR PLAYER TURN");
                  throw new IllegalArgumentException("Player card cannot be scanned during ZOMBIE phase");
            }

            if (match.getTurnPhase() == TurnPhase.ZOMBIE) {
                  var maxLevel = matchJpaRepository.findHighestPlayerLevel(match.getId());
                  if (match.getTurnPhase() == TurnPhase.ZOMBIE) {
                        final DangerLevelEnum dangerLevel = maxLevel < 8 ? DangerLevelEnum.BLUE : maxLevel < 16 ? DangerLevelEnum.YELLOW : maxLevel < 42 ? DangerLevelEnum.ORANGE : DangerLevelEnum.RED;

                        var zombieEvent = tag.getZombie().getZombieRespawns().stream()
                              .filter(z -> z.getDangerLevel() == dangerLevel).findFirst().orElse(null);

                        var z = tag.getZombie();

                        EventResponseDomain payload = zombieEvent == null ? null : new EventResponseDomain(
                              zombieEvent.getDangerLevel(), zombieEvent.getSpawnPointType(), zombieEvent.getAmount(),
                              zombieEvent.getExecutionOrder(), zombieEvent.getType(), z.getKey(), z.getName(),
                              match.getTurnPhase());

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

            } else {
                  MatchPlayerEntity actor = getMatchPlayerEntity(match);
                  TagTypeEnum tagType = tag.getTagType();

                  switch (tagType) {
                        case ITEMS_CARD -> {
                              log.info("ITEM CARD SCANNED: {}", tag.getTagUid());
                        }
                        case MISSION_OBJECTIVE -> actor.setLevel(actor.getLevel() + 5);
                        case ZOMBIE -> {
                              actor.setZombiesKill(actor.getZombiesKill() + 1);
                              actor.setLevel(actor.getLevel() + 1);
                        }
                        default -> throw new IllegalArgumentException("Unsupported tagType: " + tagType);
                  }

                  matchPlayerJpaRepository.save(actor);
            }
            return null;
      }

      private static MatchPlayerEntity getMatchPlayerEntity(MatchEntity match) {
            int idx = match.getCurrentTurnIndex() == null ? 0 : match.getCurrentTurnIndex();
            if (match.getPlayers() == null || match.getPlayers().isEmpty()) {
                  throw new IllegalStateException("Active match has no players");
            }
            if (idx < 0 || idx >= match.getPlayers().size()) {
                  throw new IllegalStateException(
                        "Invalid currentTurnIndex=" + idx + " for players=" + match.getPlayers().size());
            }

            return match.getPlayers().get(idx);
      }

      public EventResponseDomain getLastEvent() {
            var event = matchEventJpaRepository.findFirstByOrderByCreatedAtDesc().orElse(null);
            try {
                  if (event != null )
                        return objectMapper.treeToValue(event.getPayload(), EventResponseDomain.class);
                  return null;
            } catch (com.fasterxml.jackson.core.JsonProcessingException e) {
                  throw new IllegalArgumentException("Invalid payload JSON for event " + event.getId(), e);
            }
      }
}