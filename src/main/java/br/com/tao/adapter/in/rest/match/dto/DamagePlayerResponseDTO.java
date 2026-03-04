package br.com.tao.adapter.in.rest.match.dto;

import br.com.tao.domain.match.model.Match;

public record DamagePlayerResponseDTO(
      String damageEventId,
      Match match
) {}