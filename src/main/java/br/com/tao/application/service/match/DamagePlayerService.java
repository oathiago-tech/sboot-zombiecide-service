package br.com.tao.application.service.match;

import br.com.tao.adapter.in.rest.match.dto.DamagePlayerResponseDTO;
import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.entity.MatchPlayerEntity;
import br.com.tao.adapter.out.persistence.match.repository.MatchJpaRepository;
import br.com.tao.adapter.out.persistence.matchevents.entity.MatchEventEntity;
import br.com.tao.adapter.out.persistence.matchevents.repository.MatchEventJpaRepository;
import br.com.tao.application.service.enumeration.EventTypeEnum;
import br.com.tao.application.service.enumeration.TurnPhase;
import br.com.tao.domain.match.model.Match;
import br.com.tao.domain.match.model.MatchPlayer;
import br.com.tao.usecase.in.match.DamagePlayerUseCase;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.OffsetDateTime;
import java.util.Collections;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class DamagePlayerService implements DamagePlayerUseCase {

      private final MatchJpaRepository matchJpaRepository;
      private final MatchEventJpaRepository matchEventJpaRepository;
      private final ObjectMapper objectMapper;

      private record DamagePayload(String matchPlayerId, int amount, int previousLife, int newLife) {}

      @Override
      @Transactional
      public DamagePlayerResponseDTO damage(String matchPlayerId, int amount) {
            if (amount <= 0) {
                  throw new IllegalArgumentException("amount must be > 0");
            }

            UUID playerId;
            try {
                  playerId = UUID.fromString(matchPlayerId);
            } catch (IllegalArgumentException e) {
                  throw new IllegalArgumentException("Invalid matchPlayerId (UUID): " + matchPlayerId, e);
            }

            // Lock para evitar concorrência com outros eventos NFC/dano/turno
            MatchEntity match = matchJpaRepository.findActiveWithPlayersForUpdate()
                  .orElseThrow(() -> new IllegalStateException("No active match"));

            if (match.getTurnPhase() != TurnPhase.ZOMBIE) {
                  throw new IllegalStateException("Damage can only be applied during ZOMBIE phase");
            }

            MatchPlayerEntity target = match.getPlayers().stream()
                  .filter(p -> p.getId() != null && p.getId().equals(playerId))
                  .findFirst()
                  .orElseThrow(() -> new IllegalArgumentException("Player not found in active match: " + matchPlayerId));

            int previousLife = target.getLife() == null ? 0 : target.getLife();
            int newLife = Math.max(0, previousLife - amount);
            target.setLife(newLife);

            MatchEntity savedMatch = matchJpaRepository.save(match);

            String payloadJson;
            try {
                  payloadJson = objectMapper.writeValueAsString(new DamagePayload(matchPlayerId, amount, previousLife, newLife));
            } catch (JsonProcessingException e) {
                  throw new IllegalStateException("Failed to serialize damage payload", e);
            }

            MatchEventEntity event = new MatchEventEntity();
            event.setMatch(savedMatch);
            event.setActor(target); // quem sofreu o dano
            event.setEventType(EventTypeEnum.DAMAGE_ASSIGNED);
            event.setPayload(payloadJson);
            event.setCreatedAt(OffsetDateTime.now());

            MatchEventEntity savedEvent = matchEventJpaRepository.save(event);

            return new DamagePlayerResponseDTO(savedEvent.getId().toString(), toDomain(savedMatch));
      }

      private static Match toDomain(MatchEntity entity) {
            var players = entity.getPlayers() == null
                  ? Collections.<MatchPlayer>emptyList()
                  : entity.getPlayers().stream()
                  .map(p -> MatchPlayer.builder()
                        .id(p.getId() == null ? null : p.getId().toString())
                        .name(p.getName())
                        .character(p.getCharacter() == null ? null : p.getCharacter().name())
                        .life(p.getLife())
                        .level(p.getLevel())
                        .zombiesKill(p.getZombiesKill())
                        .build())
                  .toList();

            String turnPhase = entity.getTurnPhase() == null ? null : entity.getTurnPhase().name();
            Integer idx = entity.getCurrentTurnIndex();

            String currentPlayerId = null;
            if ("PLAYER".equals(turnPhase) && idx != null && idx >= 0 && idx < players.size()) {
                  currentPlayerId = players.get(idx).getId();
            }

            return Match.builder()
                  .id(entity.getId() == null ? null : entity.getId().toString())
                  .campaignName(entity.getCampaignName())
                  .difficulty(entity.getDifficulty() == null ? null : entity.getDifficulty().name())
                  .active(Boolean.TRUE.equals(entity.getActive()))
                  .createdAt(entity.getCreatedAt())
                  .players(players)
                  .turnPhase(turnPhase)
                  .currentTurnIndex(idx)
                  .currentPlayerId(currentPlayerId)
                  .build();
      }
}