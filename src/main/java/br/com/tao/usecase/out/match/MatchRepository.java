package br.com.tao.usecase.out.match;

import br.com.tao.domain.match.model.Match;

public interface MatchRepository {
      Match save(Match match);
}