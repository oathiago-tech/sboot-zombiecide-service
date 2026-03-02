package br.com.tao.adapter.mapper.match;

import br.com.tao.adapter.in.rest.match.dto.CreateMatchCampaignRequestDTO;
import br.com.tao.adapter.in.rest.match.dto.CreateMatchPlayerRequestDTO;
import br.com.tao.adapter.in.rest.match.dto.CreateMatchRequestDTO;
import br.com.tao.usecase.in.match.domain.CreateMatchCampaignDomain;
import br.com.tao.usecase.in.match.domain.CreateMatchDomain;
import br.com.tao.usecase.in.match.domain.CreateMatchPlayerDomain;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

public final class CreateMatchMapper {

      private CreateMatchMapper() {
      }

      public static CreateMatchDomain toDomain(CreateMatchRequestDTO dto) {
            if (dto == null) {
                  return null;
            }

            return CreateMatchDomain.builder()
                  .campaign(toDomain(dto.getCampaign()))
                  .difficult(dto.getDifficult())
                  .players(toPlayerDomainList(dto.getPlayers()))
                  .build();
      }

      private static CreateMatchCampaignDomain toDomain(CreateMatchCampaignRequestDTO dto) {
            if (dto == null) {
                  return null;
            }

            return CreateMatchCampaignDomain.builder()
                  .name(dto.getName())
                  .build();
      }

      private static List<CreateMatchPlayerDomain> toPlayerDomainList(List<CreateMatchPlayerRequestDTO> players) {
            if (players == null || players.isEmpty()) {
                  return Collections.emptyList();
            }

            return players.stream()
                  .filter(Objects::nonNull)
                  .map(CreateMatchMapper::toDomain)
                  .toList();
      }

      private static CreateMatchPlayerDomain toDomain(CreateMatchPlayerRequestDTO dto) {
            if (dto == null) {
                  return null;
            }

            return  CreateMatchPlayerDomain
                  .builder()
                  .name(dto.getName())
                  .build();
      }
}