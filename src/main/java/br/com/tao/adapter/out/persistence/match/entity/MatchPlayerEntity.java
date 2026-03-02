package br.com.tao.adapter.out.persistence.match.entity;

import br.com.tao.application.service.enumeration.CharacterEnum;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
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
}