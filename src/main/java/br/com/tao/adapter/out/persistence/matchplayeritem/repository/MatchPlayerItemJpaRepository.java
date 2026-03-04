package br.com.tao.adapter.out.persistence.matchplayeritem.repository;

import br.com.tao.adapter.out.persistence.match.entity.MatchPlayerItemEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface MatchPlayerItemJpaRepository extends JpaRepository<MatchPlayerItemEntity, UUID> {
}
