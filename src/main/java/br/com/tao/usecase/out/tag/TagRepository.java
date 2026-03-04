package br.com.tao.usecase.out.tag;

import br.com.tao.adapter.out.persistence.tag.entity.TagEntity;

public interface TagRepository {
      TagEntity findTagById(String tagId);
}