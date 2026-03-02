package br.com.tao.adapter.out.persistence.match.entity;

import br.com.tao.application.service.enumeration.DifficultEnum;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "matches", schema = "zombicide")
@Getter
@Setter
public class MatchEntity {

      @Id
      @GeneratedValue(strategy = GenerationType.UUID)
      private UUID id;

      @Column(name = "campaign_name", nullable = false, length = 255)
      private String campaignName;

      @Enumerated(EnumType.STRING)
      @Column(name = "difficult", nullable = false, length = 50)
      private DifficultEnum difficult;

      @OneToMany(
            mappedBy = "match",
            cascade = CascadeType.ALL,
            orphanRemoval = true,
            fetch = FetchType.LAZY
      )
      private List<MatchPlayerEntity> players = new ArrayList<>();

      public void addPlayer(MatchPlayerEntity player) {
            if (player == null) return;
            players.add(player);
            player.setMatch(this);
      }

      public void removePlayer(MatchPlayerEntity player) {
            if (player == null) return;
            players.remove(player);
            player.setMatch(null);
      }
}