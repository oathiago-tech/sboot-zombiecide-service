package br.com.tao.adapter.out.persistence.match.repository;

import br.com.tao.adapter.out.persistence.match.entity.MatchPlayerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface MatchPlayerJpaRepository extends JpaRepository<MatchPlayerEntity, UUID> {
}
