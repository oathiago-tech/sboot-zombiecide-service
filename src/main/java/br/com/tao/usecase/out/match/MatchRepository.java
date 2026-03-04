package br.com.tao.usecase.out.match;

import br.com.tao.domain.match.model.Match;

import java.util.List;

public interface MatchRepository {
      Match save(Match match);
      List<Match> findAll();
      Match findActiveMatch();
}