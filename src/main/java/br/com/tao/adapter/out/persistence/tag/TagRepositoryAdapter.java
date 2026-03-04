package br.com.tao.adapter.out.persistence.tag;

import br.com.tao.adapter.out.persistence.tag.entity.TagEntity;
import br.com.tao.adapter.out.persistence.tag.repository.TagJpaRepository;
import br.com.tao.usecase.out.tag.TagRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class TagRepositoryAdapter implements TagRepository {

      private final TagJpaRepository repository;

      @Override
      public TagEntity findTagById(String tagId) {
            return repository.findByTagUid(tagId).orElse(null);
      }
}