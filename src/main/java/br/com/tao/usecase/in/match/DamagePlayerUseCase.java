package br.com.tao.usecase.in.match;

import br.com.tao.adapter.in.rest.match.dto.DamagePlayerResponseDTO;

public interface DamagePlayerUseCase {
      DamagePlayerResponseDTO damage(String matchPlayerId, int amount);
}