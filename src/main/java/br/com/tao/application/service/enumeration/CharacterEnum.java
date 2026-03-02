package br.com.tao.application.service.enumeration;

import java.util.Arrays;

public enum CharacterEnum {
      AMY,
      JOSH,
      DOUG,
      NED,
      PHIL,
      WANDA;

      public static CharacterEnum getCharacter(String difficult) {
            return Arrays.stream(CharacterEnum.values()).filter(d -> d.name().equalsIgnoreCase(difficult)).findFirst().orElseThrow();
      }
}
