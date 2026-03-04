package br.com.tao.usecase.in.match;

import br.com.tao.domain.match.model.Match;

public interface RevertDamageUseCase {
      Match revert(String damageEventId);
}