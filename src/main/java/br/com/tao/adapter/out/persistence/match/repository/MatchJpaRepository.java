package br.com.tao.adapter.out.persistence.match.repository;

import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;
import java.util.UUID;

public interface MatchJpaRepository extends JpaRepository<MatchEntity, UUID> {
      Optional<MatchEntity> findByActive(boolean active);

      @Modifying (clearAutomatically = true, flushAutomatically = true)
      @Query ("update MatchEntity m set m.active = false where m.active = true")
      int deactivateAllActive();

      @Query ("""
            select m
            from MatchEntity m
            left join fetch m.players p
            where m.id = :matchId
            """)
      Optional<MatchEntity> findByIdWithPlayers(UUID matchId);

      @Query ("""
            select m
            from MatchEntity m
            left join fetch m.players p
            where m.active = true
            """)
      Optional<MatchEntity> findActiveWithPlayersForUpdate();

      @Query ("""
            select coalesce(max(p.level), 0)
            from MatchPlayerEntity p
            where p.match.id = :matchId
            """)
      int findHighestPlayerLevel(UUID matchId);
}