package br.com.tao.domain.match.model;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class MatchPlayer {
      private String name;
      private String character;
}