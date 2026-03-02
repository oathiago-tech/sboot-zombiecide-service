package br.com.tao.usecase.in.match.domain;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Builder
@Data
public class CreateMatchDomain {
      private CreateMatchCampaignDomain campaign;
      private String difficult;
      private List<CreateMatchPlayerDomain> players;;
}
