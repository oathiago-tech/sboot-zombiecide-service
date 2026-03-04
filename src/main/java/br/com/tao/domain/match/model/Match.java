package br.com.tao.domain.match.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.OffsetDateTime;
import java.util.List;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Match {
      private String id;
      private String campaignName;
      private String difficulty;
      private boolean active;
      private OffsetDateTime createdAt;
      private List<MatchPlayer> players;
      private String turnPhase;
      private Integer currentTurnIndex;
      private String currentPlayerId;
}