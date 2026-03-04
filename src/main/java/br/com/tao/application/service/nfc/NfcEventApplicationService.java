package br.com.tao.application.service.nfc;

import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.entity.MatchPlayerEntity;
import br.com.tao.adapter.out.persistence.match.repository.MatchJpaRepository;
import br.com.tao.application.service.enumeration.TurnPhase;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class NfcEventApplicationService {

      private final MatchJpaRepository matchJpaRepository;

      @Transactional
      public void applyNfcEvent(String eventType) {
            MatchEntity match = matchJpaRepository.findActiveWithPlayersForUpdate()
                  .orElseThrow(() -> new IllegalStateException("No active match"));

            if (match.getTurnPhase() == TurnPhase.ZOMBIE) {
                  return;
            }

            MatchPlayerEntity actor = getMatchPlayerEntity(match);

            switch (eventType) {
                  case "ZOMBIE_KILL" -> {
                        actor.setZombiesKill(actor.getZombiesKill() + 1);
                        actor.setLevel(actor.getLevel() + 1); // +1 XP
                  }
                  case "MISSION_ITEM" -> {
                        actor.setLevel(actor.getLevel() + 5); // +5 XP
                  }
                  default -> throw new IllegalArgumentException("Unknown eventType: " + eventType);
            }
      }

      private static MatchPlayerEntity getMatchPlayerEntity(MatchEntity match) {
            int idx = match.getCurrentTurnIndex() == null ? 0 : match.getCurrentTurnIndex();
            if (match.getPlayers() == null || match.getPlayers().isEmpty()) {
                  throw new IllegalStateException("Active match has no players");
            }
            if (idx < 0 || idx >= match.getPlayers().size()) {
                  throw new IllegalStateException("Invalid currentTurnIndex=" + idx + " for players=" + match.getPlayers().size());
            }

            MatchPlayerEntity actor = match.getPlayers().get(idx);
            return actor;
      }
}