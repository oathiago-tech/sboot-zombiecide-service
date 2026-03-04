package br.com.tao.domain.match.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MatchPlayer {
      private String id;
      private String name;
      private String character;
      private Integer life;
      private Integer level;
      private Integer zombiesKill;
}