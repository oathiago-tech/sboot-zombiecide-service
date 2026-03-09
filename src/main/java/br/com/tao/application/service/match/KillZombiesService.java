package br.com.tao.application.service.match;

import br.com.tao.adapter.in.rest.match.dto.KillZombiesRequestDTO;
import br.com.tao.adapter.out.persistence.match.MatchRepositoryAdapter;
import br.com.tao.adapter.out.persistence.match.repository.MatchJpaRepository;
import br.com.tao.domain.match.model.Match;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class KillZombiesService {

      private final MatchJpaRepository matchJpaRepository;

      public Match killZombies(UUID matchId, KillZombiesRequestDTO dto) {
            var matchEntity = matchJpaRepository.findById(matchId).orElse(null);
            if (matchEntity != null) {
                  switch (dto.getZombie()) {
                        case WALKERS -> matchEntity.setActiveWalkers(matchEntity.getActiveWalkers() - dto.getAmount());
                        case RUNNERS -> matchEntity.setActiveRunners(matchEntity.getActiveRunners() - dto.getAmount());
                        case FATIES -> matchEntity.setActiveFaties(matchEntity.getActiveFaties() - dto.getAmount());
                        case ABOMINATION -> matchEntity.setActiveAbomination(matchEntity.getActiveAbomination() - dto.getAmount());
                        default -> throw new IllegalArgumentException("INVALID ZOMBIE TYPE: " + dto.getZombie());
                  }
                  var matchSaved = matchJpaRepository.save(matchEntity);
                  return MatchRepositoryAdapter.toDomain(matchSaved);
            }
            return null;
      }
}
