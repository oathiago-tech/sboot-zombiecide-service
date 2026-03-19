package br.com.tao.application.service.enumeration;

import java.util.Arrays;

public enum TagTypeEnum {
      ITEM,
      ITEMS_CARD,
      MISSION_OBJECTIVE,
      PLAYER,
      ZOMBIE,
      ZOMBIE_CARD;

      public static TagTypeEnum getType(String type) {
            return Arrays.stream(TagTypeEnum.values()).filter(t -> t.name().equalsIgnoreCase(type)).findFirst()
                  .orElseThrow();
      }
}
