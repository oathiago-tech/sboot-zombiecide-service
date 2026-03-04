package br.com.tao.adapter.out.persistence.tag.repository;

import br.com.tao.adapter.out.persistence.tag.entity.TagEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface TagJpaRepository extends JpaRepository<TagEntity, UUID> {

      Optional<TagEntity> findByTagUid(String tagUid);
}