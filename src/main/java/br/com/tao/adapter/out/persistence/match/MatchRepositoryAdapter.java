package br.com.tao.adapter.out.persistence.match;

import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.entity.MatchPlayerEntity;
import br.com.tao.adapter.out.persistence.match.repository.MatchJpaRepository;
import br.com.tao.application.service.enumeration.CharacterEnum;
import br.com.tao.application.service.enumeration.DifficultyEnum;
import br.com.tao.domain.match.model.Match;
import br.com.tao.domain.match.model.MatchCampaign;
import br.com.tao.domain.match.model.MatchPlayer;
import br.com.tao.usecase.out.match.MatchRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class MatchRepositoryAdapter implements MatchRepository {

      private final MatchJpaRepository repository;

      @Override
      public Match save(Match match) {
            MatchEntity saved = repository.save(toEntity(match));
            return toDomain(saved);
      }

      @Override
      public List<Match> findAll() {
            return repository.findAll()
                  .stream()
                  .map(MatchRepositoryAdapter::toDomain)
                  .toList();
      }

      @Override
      public Match findActiveMatch() {
            return null;
      }

      private static MatchEntity toEntity(Match match) {
            MatchEntity entity = new MatchEntity();
            entity.setDifficulty(DifficultyEnum.getDifficult(match.getDifficult()));
            entity.setCampaignName(match.getCampaign() != null ? match.getCampaign().getName() : null);

            if (match.getPlayers() != null) {
                  for (MatchPlayer p : match.getPlayers()) {
                        if (p == null) continue;

                        MatchPlayerEntity pe = new MatchPlayerEntity();
                        pe.setName(p.getName());
                        pe.setCharacter(CharacterEnum.getCharacter(p.getCharacter()));
                        pe.setMatch(entity);

                        entity.getPlayers().add(pe);
                  }
            }

            return entity;
      }

      private static Match toDomain(MatchEntity entity) {
            return Match.builder()
                  .id(entity.getId().toString())
                  .difficult(entity.getDifficulty().name())
                  .campaign(MatchCampaign.builder().name(entity.getCampaignName()).build())
                  .players(entity.getPlayers() == null
                        ? Collections.emptyList()
                        : entity.getPlayers().stream()
                        .map(p -> MatchPlayer.builder()
                              .name(p.getName())
                              .character(p.getCharacter().name())
                              .build())
                        .toList()
                  )
                  .build();
      }
}