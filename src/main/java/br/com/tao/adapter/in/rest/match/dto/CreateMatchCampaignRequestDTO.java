package br.com.tao.adapter.in.rest.match.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Builder
@Data
public class CreateMatchCampaignRequestDTO {
      private String name;
}
