package br.com.tao.adapter.out.persistence.item.repository;

import br.com.tao.adapter.out.persistence.item.entity.ItemEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface ItemJpaRepository extends JpaRepository<ItemEntity, UUID> {
}
