package br.com.tao.application.service.utils;

import br.com.tao.application.service.enumeration.DangerLevelEnum;
import br.com.tao.application.service.enumeration.DifficultyEnum;

import java.util.UUID;

public final class ZombieTurnActionPlanner {

      private ZombieTurnActionPlanner() {
      }

      public static boolean shouldTriggerExtraTurn(
            UUID matchId,
            Integer currentTurnIndex,
            int actionIndex,
            int totalActions,
            int alivePlayers,
            DifficultyEnum difficulty,
            DangerLevelEnum dangerLevel
      ) {
            int players = Math.max(1, alivePlayers);
            int actions = Math.max(1, totalActions);

            // Quanto mais ações, menor a chance por ação (pra não ficar "cadeia" de extras).
            // Ex.: actions=2 => 0.9; actions=4 => 0.75
            double actionsDamp = clamp(1.05 - (0.10 * actions), 0.65, 0.95);

            double difficultyFactor = switch (difficulty == null ? DifficultyEnum.NORMAL : difficulty) {
                  case EASY -> 0.75;
                  case NORMAL -> 1.00;
                  case HARD -> 1.20;
            };

            double dangerFactor = switch (dangerLevel == null ? DangerLevelEnum.BLUE : dangerLevel) {
                  case BLUE -> 0.35;
                  case YELLOW -> 0.60;
                  case ORANGE -> 0.85;
                  case RED -> 1.10;
            };

            // Players influenciam pouco, só pra ajustar mesa grande.
            double playersFactor = clamp(0.90 + (0.03 * players), 0.90, 1.05);

            // Chance base por ação (antes dos fatores)
            double baseChance = 0.10; // 10%

            double chance = baseChance * actionsDamp * difficultyFactor * dangerFactor * playersFactor;
            chance = clamp(chance, 0.00, 0.22); // teto de 22% por ação

            int roll = deterministicRoll(matchId, currentTurnIndex, actionIndex);
            int threshold = (int) Math.round(chance * 10_000);

            return roll < threshold;
      }

      private static int deterministicRoll(UUID matchId, Integer currentTurnIndex, int actionIndex) {
            long seed = 1469598103934665603L;
            seed ^= (matchId == null ? 0L : matchId.getMostSignificantBits());
            seed *= 1099511628211L;
            seed ^= (matchId == null ? 0L : matchId.getLeastSignificantBits());
            seed *= 1099511628211L;
            seed ^= (currentTurnIndex == null ? 0L : currentTurnIndex.longValue());
            seed *= 1099511628211L;
            seed ^= actionIndex;
            seed *= 1099511628211L;

            seed ^= (seed >>> 33);
            seed *= 0xff51afd7ed558ccdL;
            seed ^= (seed >>> 33);
            seed *= 0xc4ceb9fe1a85ec53L;
            seed ^= (seed >>> 33);

            long positive = seed & Long.MAX_VALUE;
            return (int) (positive % 10_000);
      }

      private static double clamp(double v, double min, double max) {
            return Math.max(min, Math.min(max, v));
      }
}