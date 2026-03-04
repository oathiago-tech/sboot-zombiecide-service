package br.com.tao.usecase.in.match;

import br.com.tao.domain.match.model.Match;

public interface PauseMatchUseCase {
      Match pause(String matchId);
}