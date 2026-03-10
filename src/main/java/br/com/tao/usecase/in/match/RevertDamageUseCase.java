package br.com.tao.usecase.in.match;

import br.com.tao.adapter.in.rest.match.dto.RevertDamageRequestDTO;
import br.com.tao.domain.match.model.Match;

import java.util.UUID;

public interface RevertDamageUseCase {
      public Match revertDamage(UUID matchId, RevertDamageRequestDTO dto);
}