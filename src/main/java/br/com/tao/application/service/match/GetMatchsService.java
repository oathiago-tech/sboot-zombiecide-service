package br.com.tao.application.service.match;

import br.com.tao.adapter.out.persistence.match.MatchRepositoryAdapter;
import br.com.tao.domain.match.model.Match;
import br.com.tao.usecase.in.match.CreateMatchUseCase;
import br.com.tao.usecase.in.match.GetMatchsUseCase;
import br.com.tao.usecase.in.match.domain.CreateMatchDomain;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class GetMatchsService implements GetMatchsUseCase {

      private final MatchRepositoryAdapter adapter;;

      @Override
      public List<Match> getMatchs() {
            return adapter.findAll();
      }

      @Override
      public Match getActiveMatch(){
            return adapter.findActiveMatch();
      }
}
