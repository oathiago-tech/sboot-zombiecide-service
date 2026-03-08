package br.com.tao.adapter.out.persistence.zombie.entity;

import br.com.tao.application.service.enumeration.SpawnPointTypeEnum;
import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table (name = "zombies", schema = "zombicide")
@Getter
@Setter
@ToString (onlyExplicitlyIncluded = true)
@EqualsAndHashCode (onlyExplicitlyIncluded = true)
public class ZombieEntity {

      @Id
      @GeneratedValue (strategy = GenerationType.UUID)
      @EqualsAndHashCode.Include
      @ToString.Include
      private UUID id;

      @Column (name = "name", nullable = false, length = 255)
      @ToString.Include
      private String name;

      @Enumerated (EnumType.STRING)
      @Column (name = "card_effect_type", nullable = false, length = 50)
      @ToString.Include
      private SpawnPointTypeEnum cardEffectType;

      @Column (name = "key", nullable = false, length = 50)
      @ToString.Include
      private String key;

      @OneToMany (mappedBy = "zombie", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
      @OrderBy ("executionOrder ASC")
      private List<ZombieRespawnEntity> zombieRespawns = new ArrayList<>();
}