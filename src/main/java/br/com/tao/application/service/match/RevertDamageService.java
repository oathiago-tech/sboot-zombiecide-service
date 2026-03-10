package br.com.tao.application.service.match;

import br.com.tao.adapter.in.rest.match.dto.RevertDamageRequestDTO;
import br.com.tao.adapter.out.persistence.match.MatchRepositoryAdapter;
import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.entity.MatchPlayerEntity;
import br.com.tao.adapter.out.persistence.match.repository.MatchJpaRepository;
import br.com.tao.adapter.out.persistence.match.repository.MatchPlayerJpaRepository;
import br.com.tao.adapter.out.persistence.matchevents.entity.MatchEventEntity;
import br.com.tao.adapter.out.persistence.matchevents.repository.MatchEventJpaRepository;
import br.com.tao.application.service.enumeration.CharacterEnum;
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
      private final MatchPlayerJpaRepository matchPlayerJpaRepository;

      private record DamagePayload(String matchPlayerId, int amount, int previousLife, int newLife) {
      }

      @Override
      @Transactional
      public Match revertDamage(UUID matchId, RevertDamageRequestDTO dto) {
            if (matchId == null) {
                  throw new IllegalArgumentException("matchId is required");
            }
            if (dto == null) {
                  throw new IllegalArgumentException("body is required");
            }

            MatchEntity match = matchJpaRepository.findById(matchId)
                  .orElseThrow(() -> new IllegalArgumentException("Match not found: " + matchId));

            if (match.getPlayers() == null || match.getPlayers().isEmpty()) {
                  throw new IllegalStateException("Match has no players");
            }

            MatchPlayerEntity target;

            if (dto.characterCode() != null && !dto.characterCode().isBlank()) {
                  CharacterEnum character = CharacterEnum.getCharacter(dto.characterCode());

                  target = match.getPlayers().stream()
                        .filter(p -> p.getCharacter() == character)
                        .findFirst()
                        .orElseThrow(() -> new IllegalArgumentException(
                              "Player not found in match for characterCode=" + dto.characterCode()
                        ));
            } else if (dto.playerId() != null && !dto.playerId().isBlank()) {
                  UUID playerId = UUID.fromString(dto.playerId());

                  target = match.getPlayers().stream()
                        .filter(p -> p.getId() != null && p.getId().equals(playerId))
                        .findFirst()
                        .orElseThrow(() -> new IllegalArgumentException(
                              "Player not found in match for playerId=" + dto.playerId()
                        ));
            } else {
                  throw new IllegalArgumentException("playerId or characterCode is required");
            }

            target.setLife(target.getLife() + 1);
            matchPlayerJpaRepository.save(target);

            return MatchRepositoryAdapter.toDomain(match);
      }

      private static Match toDomain(MatchEntity entity) {
            var players = entity.getPlayers() == null ? Collections.<MatchPlayer>emptyList() : entity.getPlayers()
                  .stream()
                  .map(p -> MatchPlayer.builder().id(p.getId() == null ? null : p.getId().toString()).name(p.getName())
                        .character(p.getCharacter() == null ? null : p.getCharacter().name()).life(p.getLife())
                        .level(p.getLevel()).zombiesKill(p.getZombiesKill()).build()).toList();

            String turnPhase = entity.getTurnPhase() == null ? null : entity.getTurnPhase().name();
            Integer idx = entity.getCurrentTurnIndex();

            String currentPlayerId = null;
            if ("PLAYER".equals(turnPhase) && idx != null && idx >= 0 && idx < players.size()) {
                  currentPlayerId = players.get(idx).getId();
            }

            return Match.builder().id(entity.getId() == null ? null : entity.getId().toString())
                  .campaignName(entity.getCampaignName())
                  .difficulty(entity.getDifficulty() == null ? null : entity.getDifficulty().name())
                  .active(Boolean.TRUE.equals(entity.getActive())).createdAt(entity.getCreatedAt()).players(players)
                  .turnPhase(turnPhase).currentTurnIndex(idx).currentPlayerId(currentPlayerId).build();
      }
}