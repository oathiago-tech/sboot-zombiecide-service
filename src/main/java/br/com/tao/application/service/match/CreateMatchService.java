package br.com.tao.application.service.match;

import br.com.tao.adapter.out.persistence.match.MatchRepositoryAdapter;
import br.com.tao.domain.match.model.Match;
import br.com.tao.domain.match.model.MatchCampaign;
import br.com.tao.usecase.in.match.CreateMatchUseCase;
import br.com.tao.usecase.in.match.StartMatchUseCase;
import br.com.tao.usecase.in.match.domain.CreateMatchDomain;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class CreateMatchService implements CreateMatchUseCase {

      private final MatchRepositoryAdapter adapter;

      @Override
      public void createMatch(Match domain) {
            try {
                  log.info("CREATING MATCH.");
                  adapter.save(domain);
                  log.info("MATCH CREATED.");
            } catch (Exception e) {
                  log.error("ERROR: ", e);
                  throw new RuntimeException(e);
            }
      }
}
