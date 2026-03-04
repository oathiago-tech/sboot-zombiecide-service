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

import java.time.OffsetDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

@Repository
@RequiredArgsConstructor
public class MatchRepositoryAdapter implements MatchRepository {

      private static final int MAX_PLAYERS = 6;

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
            return MatchRepositoryAdapter.toDomain(Objects.requireNonNull(repository.findByActive(Boolean.TRUE).orElse(null)));
      }

      private static MatchEntity toEntity(Match match) {
            if (match == null) {
                  throw new IllegalArgumentException("MATCH MUST NOT BE NULL");
            }

            if (match.getPlayers() != null && match.getPlayers().size() > MAX_PLAYERS) {
                  throw new IllegalArgumentException("MAX PLAYERS IS " + MAX_PLAYERS + ", GOT " + match.getPlayers().size());
            }

            MatchEntity entity = new MatchEntity();
            entity.setDifficulty(DifficultyEnum.getDifficult(match.getDifficulty()));
            entity.setCampaignName(match.getCampaignName());
            entity.setActive(Boolean.FALSE);
            entity.setCreatedAt(OffsetDateTime.now());

            if (match.getPlayers() != null) {
                  for (MatchPlayer p : match.getPlayers()) {
                        if (p == null) continue;
                        if (p.getName() == null || p.getName().isBlank()) continue;
                        if (p.getCharacter() == null || p.getCharacter().isBlank()) continue;

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