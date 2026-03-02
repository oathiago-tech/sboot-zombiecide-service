package br.com.tao.adapter.in.rest.match.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Builder
@Data
public class CreateMatchRequestDTO {
      private CreateMatchCampaignRequestDTO campaign;
      private String difficult;
      private List<CreateMatchPlayerRequestDTO> players;
}
