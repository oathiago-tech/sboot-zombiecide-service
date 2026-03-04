package br.com.tao.application.service.enumeration;

import java.util.Arrays;

public enum TagTypeEnum {
      PLAYER, ZOMBIE, ZOMBIE_CARD, ITEMS_CARD;

      public static TagTypeEnum getType(String type) {
            return Arrays.stream(TagTypeEnum.values()).filter(t -> t.name().equalsIgnoreCase(type)).findFirst().orElseThrow();
      }
}
