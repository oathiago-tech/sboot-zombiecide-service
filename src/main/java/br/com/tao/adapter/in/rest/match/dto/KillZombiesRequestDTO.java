package br.com.tao.adapter.in.rest.match.dto;

import br.com.tao.application.service.enumeration.ZombieTypeEnum;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class KillZombiesRequestDTO {
      private ZombieTypeEnum zombie;
      private Integer amount;
}
