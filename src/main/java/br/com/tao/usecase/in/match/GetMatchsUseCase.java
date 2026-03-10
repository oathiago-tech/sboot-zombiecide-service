package br.com.tao.usecase.in.match;

import br.com.tao.domain.match.model.Match;

import java.util.List;
import java.util.UUID;

public interface GetMatchsUseCase {
      List<Match> getMatchs();

      Match getActiveMatch();

      Match getMatch(UUID matchId);
}
