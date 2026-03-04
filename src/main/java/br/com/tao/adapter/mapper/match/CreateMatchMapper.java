package br.com.tao.adapter.mapper.match;

import br.com.tao.adapter.in.rest.match.dto.CreateMatchPlayerRequestDTO;
import br.com.tao.adapter.in.rest.match.dto.CreateMatchRequestDTO;
import br.com.tao.domain.match.model.Match;
import br.com.tao.domain.match.model.MatchPlayer;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

public final class CreateMatchMapper {

      private CreateMatchMapper() {
      }

      public static Match toDomain(CreateMatchRequestDTO dto) {
            if (dto == null) {
                  return null;
            }

            return Match.builder().campaignName(dto.getCampaign().getName()).difficulty(dto.getDifficult()).players(toPlayerDomainList(dto.getPlayers())).build();
      }

      private static List<MatchPlayer> toPlayerDomainList(List<CreateMatchPlayerRequestDTO> players) {
            if (players == null || players.isEmpty()) {
                  return Collections.emptyList();
            }

            return players.stream().filter(Objects::nonNull).map(CreateMatchMapper::toDomain).toList();
      }

      private static MatchPlayer toDomain(CreateMatchPlayerRequestDTO dto) {
            if (dto == null) {
                  return null;
            }

            return MatchPlayer.builder().name(dto.getName()).character(dto.getCharacter()).build();
      }
}