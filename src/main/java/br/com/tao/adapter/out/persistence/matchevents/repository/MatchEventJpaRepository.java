package br.com.tao.adapter.out.persistence.matchevents.repository;

import br.com.tao.adapter.out.persistence.matchevents.entity.MatchEventEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface MatchEventJpaRepository extends JpaRepository<MatchEventEntity, UUID> {
}
