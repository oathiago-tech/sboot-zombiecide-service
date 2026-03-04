package br.com.tao.usecase.out.tag;

import br.com.tao.adapter.out.persistence.tag.entity.TagEntity;
import br.com.tao.domain.match.model.Match;

import java.util.List;

public interface TagRepository {
      TagEntity findTagById(String tagId);
}