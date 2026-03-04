package br.com.tao.adapter.out.persistence.match.entity;

import br.com.tao.application.service.enumeration.DifficultyEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;
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
      @Column(name = "difficulty", nullable = false, length = 50)
      private DifficultyEnum difficulty;

      @Column(name = "active", nullable = false)
      private Boolean active = Boolean.FALSE;

      @Column(name = "created_at", nullable = false)
      private OffsetDateTime createdAt;

      @OneToMany(
            mappedBy = "match",
            cascade = CascadeType.ALL,
            orphanRemoval = true,
            fetch = FetchType.LAZY
      )
      private List<MatchPlayerEntity> players = new ArrayList<>();
}