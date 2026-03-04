package br.com.tao.domain.match.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Match {
      private String id;
      private MatchCampaign campaign;
      private String difficult;
      private List<MatchPlayer> players;
}