package br.com.tao.application.service.match;

import br.com.tao.usecase.in.match.StartMatchUseCase;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class StartMatchService implements StartMatchUseCase {

      @Override
      public void startMatch() {
            log.info("STARTING MATCH.");
            log.info("MATCH STARTED.");
      }
}
