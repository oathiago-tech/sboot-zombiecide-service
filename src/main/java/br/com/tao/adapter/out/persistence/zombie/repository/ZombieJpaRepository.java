package br.com.tao.adapter.out.persistence.zombie.repository;

import br.com.tao.adapter.out.persistence.zombie.entity.ZombieEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface ZombieJpaRepository extends JpaRepository<ZombieEntity, UUID> {
}
