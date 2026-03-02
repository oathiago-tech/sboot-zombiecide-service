package br.com.tao.adapter.in.rest.match.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class CreateMatchPlayerRequestDTO {
      private String name;
      private String character;
}
