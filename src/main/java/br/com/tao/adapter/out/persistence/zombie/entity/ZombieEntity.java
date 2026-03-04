package br.com.tao.adapter.out.persistence.zombie.entity;

import br.com.tao.application.service.enumeration.ZombieTypeEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "zombies", schema = "zombicide")
@Getter
@Setter
public class ZombieEntity {

      @Id
      @GeneratedValue(strategy = GenerationType.UUID)
      private UUID id;

      @Column(name = "name", nullable = false, length = 255)
      private String name;

      @Enumerated(EnumType.STRING)
      @Column(name = "type", nullable = false, length = 50)
      private ZombieTypeEnum type;
}