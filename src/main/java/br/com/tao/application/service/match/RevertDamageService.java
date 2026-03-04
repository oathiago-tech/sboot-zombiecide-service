package br.com.tao.application.service.match;

import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.entity.MatchPlayerEntity;
import br.com.tao.adapter.out.persistence.match.repository.MatchJpaRepository;
import br.com.tao.adapter.out.persistence.matchevents.entity.MatchEventEntity;
import br.com.tao.adapter.out.persistence.matchevents.repository.MatchEventJpaRepository;
import br.com.tao.application.service.enumeration.EventTypeEnum;
import br.com.tao.domain.match.model.Match;
import br.com.tao.domain.match.model.MatchPlayer;
import br.com.tao.usecase.in.match.RevertDamageUseCase;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.OffsetDateTime;
import java.util.Collections;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RevertDamageService implements RevertDamageUseCase {

      private final MatchJpaRepository matchJpaRepository;
      private final MatchEventJpaRepository matchEventJpaRepository;
      private final ObjectMapper objectMapper;

      private record DamagePayload(String matchPlayerId, int amount, int previousLife, int newLife) {
      }

      @Override
      @Transactional
      public Match revert(String damageEventId) {
            UUID eventId;
            try {
                  eventId = UUID.fromString(damageEventId);
            } catch (IllegalArgumentException e) {
                  throw new IllegalArgumentException("Invalid damageEventId (UUID): " + damageEventId, e);
            }

            MatchEventEntity damageEvent = matchEventJpaRepository.findById(eventId).orElseThrow(() -> new IllegalArgumentException("Damage event not found: " + damageEventId));

            if (damageEvent.getEventType() != EventTypeEnum.DAMAGE_ASSIGNED) {
                  throw new IllegalArgumentException("Event is not DAMAGE_ASSIGNED: " + damageEventId);
            }

            DamagePayload payload;
            try {
                  payload = objectMapper.treeToValue(damageEvent.getPayload(), DamagePayload.class);
            } catch (Exception e) {
                  throw new IllegalStateException("Failed to parse damage payload for event: " + damageEventId, e);
            }

            // Lock na partida ativa (ou, alternativamente, buscar por matchId do evento)
            MatchEntity match = matchJpaRepository.findActiveWithPlayersForUpdate().orElseThrow(() -> new IllegalStateException("No active match"));

            UUID playerId = UUID.fromString(payload.matchPlayerId());

            MatchPlayerEntity target = match.getPlayers().stream().filter(p -> p.getId() != null && p.getId().equals(playerId)).findFirst().orElseThrow(() -> new IllegalArgumentException("Player not found in active match: " + payload.matchPlayerId()));

            target.setLife(payload.previousLife());

            MatchEntity savedMatch = matchJpaRepository.save(match);

            MatchEventEntity revertEvent = new MatchEventEntity();
            revertEvent.setMatch(savedMatch);
            revertEvent.setActor(target);
            revertEvent.setEventType(EventTypeEnum.DAMAGE_REVERTED);
            revertEvent.setPayload(damageEvent.getPayload());
            revertEvent.setCreatedAt(OffsetDateTime.now());
            matchEventJpaRepository.save(revertEvent);

            return toDomain(savedMatch);
      }

      private static Match toDomain(MatchEntity entity) {
            var players = entity.getPlayers() == null ? Collections.<MatchPlayer>emptyList() : entity.getPlayers().stream().map(p -> MatchPlayer.builder().id(p.getId() == null ? null : p.getId().toString()).name(p.getName()).character(p.getCharacter() == null ? null : p.getCharacter().name()).life(p.getLife()).level(p.getLevel()).zombiesKill(p.getZombiesKill()).build()).toList();

            String turnPhase = entity.getTurnPhase() == null ? null : entity.getTurnPhase().name();
            Integer idx = entity.getCurrentTurnIndex();

            String currentPlayerId = null;
            if ("PLAYER".equals(turnPhase) && idx != null && idx >= 0 && idx < players.size()) {
                  currentPlayerId = players.get(idx).getId();
            }

            return Match.builder().id(entity.getId() == null ? null : entity.getId().toString()).campaignName(entity.getCampaignName()).difficulty(entity.getDifficulty() == null ? null : entity.getDifficulty().name()).active(Boolean.TRUE.equals(entity.getActive())).createdAt(entity.getCreatedAt()).players(players).turnPhase(turnPhase).currentTurnIndex(idx).currentPlayerId(currentPlayerId).build();
      }
}