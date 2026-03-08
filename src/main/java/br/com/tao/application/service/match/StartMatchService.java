package br.com.tao.application.service.match;

import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.repository.MatchJpaRepository;
import br.com.tao.domain.match.model.Match;
import br.com.tao.domain.match.model.MatchPlayer;
import br.com.tao.usecase.in.match.StartMatchUseCase;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class StartMatchService implements StartMatchUseCase {

      private final MatchJpaRepository matchJpaRepository;

      @Override
      @Transactional
      public Match startMatch(String matchId) {
            UUID id;
            try {
                  id = UUID.fromString(matchId);
            } catch (IllegalArgumentException e) {
                  throw new IllegalArgumentException("Invalid match id (UUID): " + matchId, e);
            }

            matchJpaRepository.deactivateAllActive();

            MatchEntity match = matchJpaRepository.findByIdWithPlayers(id)
                  .orElseThrow(() -> new IllegalArgumentException("Match not found: " + matchId));

            match.setActive(Boolean.TRUE);
            MatchEntity saved = matchJpaRepository.save(match);

            return Match.builder().id(saved.getId().toString()).campaignName(saved.getCampaignName())
                  .difficulty(saved.getDifficulty().name()).active(true).createdAt(saved.getCreatedAt()).players(
                        saved.getPlayers() == null ? java.util.List.<MatchPlayer>of() : saved.getPlayers().stream()
                              .map(p -> MatchPlayer.builder().id(p.getId() == null ? null : p.getId().toString())
                                    .name(p.getName())
                                    .character(p.getCharacter() == null ? null : p.getCharacter().name())
                                    .life(p.getLife()).level(p.getLevel()).zombiesKill(p.getZombiesKill()).build())
                              .toList()).turnPhase(saved.getTurnPhase() == null ? null : saved.getTurnPhase().name())
                  .currentTurnIndex(saved.getCurrentTurnIndex()).currentPlayerId(null).build();
      }
}