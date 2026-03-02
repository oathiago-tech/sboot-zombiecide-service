package br.com.tao.application.service.enumeration;

import java.util.Arrays;

public enum DifficultEnum {
      EASY, MEDIUM, HARD;

      public static DifficultEnum getDifficult(String difficult) {
            return Arrays.stream(DifficultEnum.values()).filter(d -> d.name().equalsIgnoreCase(difficult)).findFirst().orElseThrow();
      }
}
