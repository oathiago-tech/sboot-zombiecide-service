package br.com.tao.adapter.out.persistence.tag.entity;

import br.com.tao.application.service.enumeration.TagTypeEnum;
import br.com.tao.adapter.out.persistence.item.entity.ItemEntity;
import br.com.tao.adapter.out.persistence.zombie.entity.ZombieEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(
      name = "tags",
      schema = "zombicide",
      uniqueConstraints = {
            @UniqueConstraint(name = "uk_tags_tag_uid", columnNames = "tag_uid")
      }
)
@Getter
@Setter
public class TagEntity {

      @Id
      @GeneratedValue(strategy = GenerationType.UUID)
      private UUID id;

      @Column(name = "tag_uid", nullable = false, length = 255)
      private String tagUid;

      @Enumerated(EnumType.STRING)
      @Column(name = "tag_type", nullable = false, length = 50)
      private TagTypeEnum tagType;

      @ManyToOne(fetch = FetchType.LAZY)
      @JoinColumn(name = "item_id")
      private ItemEntity item;

      @ManyToOne(fetch = FetchType.LAZY)
      @JoinColumn(name = "zombie_id")
      private ZombieEntity zombie;

      @Column(name = "active", nullable = false)
      private Boolean active = Boolean.TRUE;
}