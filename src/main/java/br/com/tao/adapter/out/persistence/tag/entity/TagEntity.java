package br.com.tao.adapter.out.persistence.tag.entity;

import br.com.tao.adapter.out.persistence.match.entity.MatchPlayerEntity;
import br.com.tao.application.service.enumeration.DifficultEnum;
import br.com.tao.application.service.enumeration.TagTypeEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "tags", schema = "zombicide")
@Getter
@Setter
public class TagEntity {

      @Id
      @GeneratedValue(strategy = GenerationType.UUID)
      private UUID id;

      @Column(name = "tag_id", nullable = false, length = 255)
      private String tagId;

      @Enumerated(EnumType.STRING)
      @Column(name = "tag_type", nullable = false, length = 50)
      private TagTypeEnum tagType;

      @Enumerated(EnumType.STRING)
      @Column(name = "zombie_type", nullable = false, length = 50)
      private TagTypeEnum zombieType;

      @Column(name = "value", nullable = false, length = 100)
      private String value;

      private Boolean active;
}