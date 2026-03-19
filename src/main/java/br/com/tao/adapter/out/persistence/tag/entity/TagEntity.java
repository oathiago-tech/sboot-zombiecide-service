package br.com.tao.adapter.out.persistence.tag.entity;

import br.com.tao.application.service.enumeration.CharacterEnum;
import br.com.tao.application.service.enumeration.TagTypeEnum;
import br.com.tao.application.service.enumeration.ZombieTypeEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table (name = "tags", schema = "zombicide", uniqueConstraints = {@UniqueConstraint (name = "uk_tags_tag_uid", columnNames = "tag_uid")})
@Getter
@Setter
public class TagEntity {

      @Id
      @GeneratedValue (strategy = GenerationType.UUID)
      private UUID id;

      @Column (name = "tag_uid", nullable = false, length = 255)
      private String tagUid;

      @Enumerated (EnumType.STRING)
      @Column (name = "tag_type", nullable = false, length = 50)
      private TagTypeEnum tagType;

      @Column (name = "active", nullable = false)
      private Boolean active = Boolean.TRUE;

      @Enumerated (EnumType.STRING)
      @Column (name = "player_character", length = 255)
      private CharacterEnum playerCharacter;

      @Enumerated (EnumType.STRING)
      @Column (name = "zombie_type", length = 255)
      private ZombieTypeEnum zombieType;

      private String name;

      private Integer life;

      //      BLUE LEVEL
      @Column (name = "blue_zombie_amount")
      private Integer blueZombieAmount;
      @Enumerated (EnumType.STRING)
      @Column (name = "blue_zombie_type")
      private ZombieTypeEnum blueZombieType;

      //      YELLOW LEVEL
      @Column (name = "yellow_zombie_amount")
      private Integer yellowZombieAmount;
      @Enumerated(EnumType.STRING)
      @Column (name = "yellow_zombie_type")
      private ZombieTypeEnum yellowZombieType;

      //      ORANGE LEVEL
      @Column (name = "orange_zombie_amount")
      private Integer orangeZombieAmount;
      @Enumerated(EnumType.STRING)
      @Column (name = "orange_zombie_type")
      private ZombieTypeEnum orangeZombieType;

      //      RED LEVEL
      @Column (name = "red_zombie_amount")
      private Integer redZombieAmount;
      @Enumerated(EnumType.STRING)
      @Column (name = "red_zombie_type")
      private ZombieTypeEnum redZombieType;
}