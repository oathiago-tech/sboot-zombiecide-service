package br.com.tao.usecase.in.match;

import br.com.tao.domain.match.model.Match;

import java.util.List;

public interface GetMatchsUseCase {
      List<Match> getMatchs();
      Match getActiveMatch();
}
