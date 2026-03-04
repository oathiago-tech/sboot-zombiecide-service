package br.com.tao.adapter.out.persistence.match.repository;

import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface MatchJpaRepository extends JpaRepository<MatchEntity, UUID> {
      Optional<MatchEntity> findByActive(boolean active);
}