package br.com.tao.application.service.match;

import br.com.tao.adapter.out.persistence.match.MatchRepositoryAdapter;
import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.repository.MatchJpaRepository;
import br.com.tao.domain.match.model.Match;
import br.com.tao.domain.match.model.MatchPlayer;
import br.com.tao.usecase.in.match.GetMatchsUseCase;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class GetMatchsService implements GetMatchsUseCase {

      private final MatchRepositoryAdapter adapter;
      private final MatchJpaRepository matchJpaRepository;
      ;

      @Override
      public List<Match> getMatchs() {
            return adapter.findAll();
      }

      @Override
      public Match getActiveMatch() {
            return adapter.findActiveMatch();
      }

      @Transactional
      public Match getMatch(UUID matchId) {
            MatchEntity entity = matchJpaRepository.findByIdWithPlayers(matchId)
                  .orElseThrow(() -> new IllegalArgumentException("Match not found: " + matchId));

            String currentPlayerId = null;
            if (entity.getPlayers() != null && !entity.getPlayers().isEmpty()) {
                  int idx = entity.getCurrentTurnIndex() == null ? 0 : entity.getCurrentTurnIndex();
                  if (idx >= 0 && idx < entity.getPlayers().size()) {
                        var current = entity.getPlayers().get(idx);
                        currentPlayerId = current.getId() == null ? null : current.getId().toString();
                  }
            }

            return Match.builder()
                  .id(entity.getId().toString())
                  .campaignName(entity.getCampaignName())
                  .difficulty(entity.getDifficulty() == null ? null : entity.getDifficulty().name())
                  .active(Boolean.TRUE.equals(entity.getActive()))
                  .createdAt(entity.getCreatedAt())
                  .players(entity.getPlayers() == null ? Collections.emptyList() : entity.getPlayers().stream()
                        .map(p -> MatchPlayer.builder()
                              .id(p.getId() == null ? null : p.getId().toString())
                              .name(p.getName())
                              .character(p.getCharacter() == null ? null : p.getCharacter().name())
                              .life(p.getLife())
                              .level(p.getLevel())
                              .zombiesKill(p.getZombiesKill())
                              .build())
                        .toList())
                  .turnPhase(entity.getTurnPhase() == null ? null : entity.getTurnPhase().name())
                  .currentTurnIndex(entity.getCurrentTurnIndex())
                  .currentPlayerId(currentPlayerId)
                  .activeWalkers(entity.getActiveWalkers())
                  .activeRunners(entity.getActiveRunners())
                  .activeFaties(entity.getActiveFaties())
                  .activeAbomination(entity.getActiveAbomination())
                  .build();
      }
}
