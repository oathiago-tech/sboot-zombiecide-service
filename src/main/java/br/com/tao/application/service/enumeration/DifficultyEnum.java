package br.com.tao.application.service.enumeration;

import java.util.Arrays;

public enum DifficultyEnum {
      EASY, NORMAL, HARD;

      public static DifficultyEnum getDifficult(String difficulty) {
            return Arrays.stream(DifficultyEnum.values())
                  .filter(d -> d.name().equalsIgnoreCase(difficulty))
                  .findFirst()
                  .orElseThrow(() -> new IllegalArgumentException("Unknown difficulty: " + difficulty));
      }
}
