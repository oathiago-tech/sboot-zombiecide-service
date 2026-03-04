package br.com.tao.application.service.match;

import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.repository.MatchJpaRepository;
import br.com.tao.application.service.enumeration.TurnPhase;
import br.com.tao.domain.match.model.Match;
import br.com.tao.domain.match.model.MatchPlayer;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
@RequiredArgsConstructor
public class AdvanceTurnService {

      private final MatchJpaRepository matchJpaRepository;

      @Transactional
      public Match nextTurn() {
            MatchEntity match = matchJpaRepository.findActiveWithPlayersForUpdate()
                  .orElseThrow(() -> new IllegalStateException("No active match"));

            int playerCount = match.getPlayers() == null ? 0 : match.getPlayers().size();
            if (playerCount <= 0) {
                  throw new IllegalStateException("Active match has no players");
            }

            if (match.getTurnPhase() == TurnPhase.PLAYER) {
                  int idx = match.getCurrentTurnIndex() == null ? 0 : match.getCurrentTurnIndex();
                  if (idx < playerCount - 1) {
                        match.setCurrentTurnIndex(idx + 1);
                  } else {
                        match.setTurnPhase(TurnPhase.ZOMBIE);
                        match.setCurrentTurnIndex(0);
                  }
            } else {
                  match.setTurnPhase(TurnPhase.PLAYER);
                  match.setCurrentTurnIndex(0);
            }

            MatchEntity saved = matchJpaRepository.save(match);

            return Match.builder()
                  .id(saved.getId().toString())
                  .campaignName(saved.getCampaignName())
                  .difficulty(saved.getDifficulty().name())
                  .active(Boolean.TRUE.equals(saved.getActive()))
                  .createdAt(saved.getCreatedAt())
                  .players(saved.getPlayers() == null
                        ? Collections.emptyList()
                        : saved.getPlayers().stream()
                        .map(p -> MatchPlayer.builder()
                              .id(p.getId() == null ? null : p.getId().toString())
                              .name(p.getName())
                              .character(p.getCharacter() == null ? null : p.getCharacter().name())
                              .life(p.getLife())
                              .level(p.getLevel())
                              .zombiesKill(p.getZombiesKill())
                              .build())
                        .toList())
                  .turnPhase(saved.getTurnPhase() == null ? null : saved.getTurnPhase().name())
                  .currentPlayerId(saved.getCurrentTurnIndex() == null ? null : saved.getPlayers().get(saved.getCurrentTurnIndex()).getId().toString())
                  .currentTurnIndex(saved.getCurrentTurnIndex())
                  .build();
      }
}