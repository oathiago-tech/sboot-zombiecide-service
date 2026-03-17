package br.com.tao.application.service.utils;

import br.com.tao.application.service.enumeration.DangerLevelEnum;
import br.com.tao.application.service.enumeration.DifficultyEnum;
import br.com.tao.application.service.enumeration.ZombieTypeEnum;

import java.util.Comparator;
import java.util.EnumMap;
import java.util.LinkedHashMap;
import java.util.Map;

public final class ZombieAutoSpawnCalculator {

      private ZombieAutoSpawnCalculator() {
      }

      public static Map<ZombieTypeEnum, Integer> calculate(
            int alivePlayers,
            DifficultyEnum difficulty,
            DangerLevelEnum dangerLevel,
            int baseSpawnsAmount
      ) {
            int safePlayers = Math.max(1, alivePlayers);
            int safeBase = Math.max(1, baseSpawnsAmount);

            double difficultyFactor = switch (difficulty == null ? DifficultyEnum.NORMAL : difficulty) {
                  case EASY -> 0.85;
                  case NORMAL -> 1.00;
                  case HARD -> 1.20;
            };

            double dangerFactor = switch (dangerLevel == null ? DangerLevelEnum.BLUE : dangerLevel) {
                  case BLUE -> 0.85;
                  case YELLOW -> 1.00;
                  case ORANGE -> 1.20;
                  case RED -> 1.45;
            };

            double playersFactor = 0.65 + (0.10 * safePlayers);
            playersFactor = clamp(playersFactor, 0.75, 1.10);

            int total = (int) Math.round(safeBase * difficultyFactor * dangerFactor * playersFactor);
            total = Math.max(1, total);

            Weights w = weightsFor(dangerLevel);

            Map<ZombieTypeEnum, Double> raw = new EnumMap<>(ZombieTypeEnum.class);
            raw.put(ZombieTypeEnum.WALKERS, total * w.walkers());
            raw.put(ZombieTypeEnum.RUNNERS, total * w.runners());
            raw.put(ZombieTypeEnum.FATIES, total * w.faties());
            raw.put(ZombieTypeEnum.ABOMINATION, total * w.abomination());

            Map<ZombieTypeEnum, Integer> out = new EnumMap<>(ZombieTypeEnum.class);
            int used = 0;
            for (var e : raw.entrySet()) {
                  int v = (int) Math.floor(e.getValue());
                  out.put(e.getKey(), v);
                  used += v;
            }

            int remaining = total - used;
            if (remaining > 0) {
                  var byFraction = raw.entrySet().stream()
                        .sorted(Comparator.<Map.Entry<ZombieTypeEnum, Double>>comparingDouble(e -> fractional(e.getValue()))
                              .reversed()
                              .thenComparing(e -> e.getKey().name()))
                        .toList();

                  int idx = 0;
                  while (remaining > 0) {
                        ZombieTypeEnum type = byFraction.get(idx % byFraction.size()).getKey();
                        out.put(type, out.get(type) + 1);
                        remaining--;
                        idx++;
                  }
            }

            if (dangerLevel == null || dangerLevel == DangerLevelEnum.BLUE || dangerLevel == DangerLevelEnum.YELLOW) {
                  int ab = out.getOrDefault(ZombieTypeEnum.ABOMINATION, 0);
                  if (ab > 0) {
                        out.put(ZombieTypeEnum.ABOMINATION, 0);
                        out.put(ZombieTypeEnum.WALKERS, out.getOrDefault(ZombieTypeEnum.WALKERS, 0) + ab);
                  }
            } else {
                  int ab = out.getOrDefault(ZombieTypeEnum.ABOMINATION, 0);
                  if (ab > 1) {
                        out.put(ZombieTypeEnum.ABOMINATION, 1);
                        out.put(ZombieTypeEnum.WALKERS, out.getOrDefault(ZombieTypeEnum.WALKERS, 0) + (ab - 1));
                  }
            }

            Map<ZombieTypeEnum, Integer> ordered = new LinkedHashMap<>();
            ordered.put(ZombieTypeEnum.WALKERS, out.getOrDefault(ZombieTypeEnum.WALKERS, 0));
            ordered.put(ZombieTypeEnum.RUNNERS, out.getOrDefault(ZombieTypeEnum.RUNNERS, 0));
            ordered.put(ZombieTypeEnum.FATIES, out.getOrDefault(ZombieTypeEnum.FATIES, 0));
            ordered.put(ZombieTypeEnum.ABOMINATION, out.getOrDefault(ZombieTypeEnum.ABOMINATION, 0));
            return ordered;
      }

      private static Weights weightsFor(DangerLevelEnum dangerLevel) {
            DangerLevelEnum d = dangerLevel == null ? DangerLevelEnum.BLUE : dangerLevel;
            return switch (d) {
                  case BLUE -> new Weights(0.80, 0.20, 0.00, 0.00);
                  case YELLOW -> new Weights(0.65, 0.25, 0.10, 0.00);
                  case ORANGE -> new Weights(0.55, 0.25, 0.15, 0.05);
                  case RED -> new Weights(0.45, 0.30, 0.18, 0.07);
            };
      }

      private static double fractional(double v) {
            return v - Math.floor(v);
      }

      private static double clamp(double v, double min, double max) {
            return Math.max(min, Math.min(max, v));
      }

      private record Weights(double walkers, double runners, double faties, double abomination) {
      }
}