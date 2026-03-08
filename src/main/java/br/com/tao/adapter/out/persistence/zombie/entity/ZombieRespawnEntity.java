package br.com.tao.adapter.out.persistence.zombie.entity;

import br.com.tao.application.service.enumeration.DangerLevelEnum;
import br.com.tao.application.service.enumeration.SpawnPointTypeEnum;
import br.com.tao.application.service.enumeration.ZombieTypeEnum;
import jakarta.persistence.*;
import lombok.Data;

import java.util.UUID;

@Entity
@Table (name = "zombie_respawns", schema = "zombicide", indexes = {@Index (name = "ix_zombie_respawns_zombie_id", columnList = "zombie_id"), @Index (name = "ix_zombie_respawns_zombie_id_danger", columnList = "zombie_id, danger_level")})
@Data
public class ZombieRespawnEntity {

      @Id
      @GeneratedValue (strategy = GenerationType.UUID)
      private UUID id;

      @ManyToOne (fetch = FetchType.LAZY, optional = false)
      @JoinColumn (name = "zombie_id", nullable = false)
      private ZombieEntity zombie;

      @Enumerated (EnumType.STRING)
      @Column (name = "danger_level", nullable = false, length = 50)
      private DangerLevelEnum dangerLevel;

      @Enumerated (EnumType.STRING)
      @Column (name = "spawn_point_type", nullable = false, length = 50)
      private SpawnPointTypeEnum spawnPointType;

      @Column (name = "amount", nullable = false)
      private Integer amount;

      @Column (name = "execution_order", nullable = false)
      private Integer executionOrder;

      @Enumerated (EnumType.STRING)
      @Column (name = "type", nullable = false, length = 50)
      private ZombieTypeEnum type;
}