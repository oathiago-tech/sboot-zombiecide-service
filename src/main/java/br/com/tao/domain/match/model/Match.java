package br.com.tao.domain.match.model;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Builder
@Data
public class Match {
      private String id;
      private MatchCampaign campaign;
      private String difficult;
      private List<MatchPlayer> players;
}