package br.com.tao.application.service.enumeration;

import java.util.Arrays;

public enum ZombieTypeEnum {
      WALKERS, RUNNERS, FATIES, ABOMINATION;

      public static ZombieTypeEnum getType(String type) {
            return Arrays.stream(ZombieTypeEnum.values()).filter(z -> z.name().equalsIgnoreCase(type)).findFirst().orElseThrow();
      }
}
