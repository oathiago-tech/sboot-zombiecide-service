package br.com.tao.application.service.match;

import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.repository.MatchJpaRepository;
import br.com.tao.domain.match.model.Match;
import br.com.tao.domain.match.model.MatchPlayer;
import br.com.tao.usecase.in.match.PauseMatchUseCase;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class PauseMatchService implements PauseMatchUseCase {

      private final MatchJpaRepository matchJpaRepository;

      @Override
      @Transactional
      public Match pause(String matchId) {
            UUID id;
            try {
                  id = UUID.fromString(matchId);
            } catch (IllegalArgumentException e) {
                  throw new IllegalArgumentException("INVALID MATCH ID (UUID): " + matchId, e);
            }

            MatchEntity match = matchJpaRepository.findByIdWithPlayers(id)
                  .orElseThrow(() -> new IllegalArgumentException("MATCH NOT FOUND: " + matchId));

            match.setActive(Boolean.FALSE);

            MatchEntity saved = matchJpaRepository.save(match);

            var players = saved.getPlayers() == null
                  ? Collections.<MatchPlayer>emptyList()
                  : saved.getPlayers().stream()
                  .map(p -> MatchPlayer.builder()
                        .id(p.getId() == null ? null : p.getId().toString())
                        .name(p.getName())
                        .character(p.getCharacter() == null ? null : p.getCharacter().name())
                        .life(p.getLife())
                        .level(p.getLevel())
                        .zombiesKill(p.getZombiesKill())
                        .build())
                  .toList();

            String turnPhase = saved.getTurnPhase() == null ? null : saved.getTurnPhase().name();
            Integer idx = saved.getCurrentTurnIndex();

            String currentPlayerId = null;
            if ("PLAYER".equals(turnPhase) && idx != null && idx >= 0 && idx < players.size()) {
                  currentPlayerId = players.get(idx).getId();
            }

            return Match.builder()
                  .id(saved.getId() == null ? null : saved.getId().toString())
                  .campaignName(saved.getCampaignName())
                  .difficulty(saved.getDifficulty() == null ? null : saved.getDifficulty().name())
                  .active(false)
                  .createdAt(saved.getCreatedAt())
                  .players(players)
                  .turnPhase(turnPhase)
                  .currentTurnIndex(idx)
                  .currentPlayerId(currentPlayerId)
                  .build();
      }
}