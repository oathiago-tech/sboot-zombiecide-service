package br.com.tao.adapter.out.persistence.match.entity;

import br.com.tao.application.service.enumeration.CharacterEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "match_players", schema = "zombicide")
@Getter
@Setter
public class MatchPlayerEntity {

      @Id
      @GeneratedValue(strategy = GenerationType.UUID)
      private UUID id;

      @ManyToOne(fetch = FetchType.LAZY, optional = false)
      @JoinColumn(name = "match_id", nullable = false)
      private MatchEntity match;

      @Column(name = "player_name", nullable = false, length = 255)
      private String name;

      @Enumerated(EnumType.STRING)
      @Column(name = "player_character", nullable = false, length = 255)
      private CharacterEnum character;

      @Column(name = "player_life", nullable = false)
      private Integer life = 3;

      @Column(name = "player_level", nullable = false)
      private Integer level = 0;

      @Column(name = "zombies_kill", nullable = false)
      private Integer zombiesKill = 0;
}