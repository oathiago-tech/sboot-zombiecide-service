package br.com.tao.application.service.match;

import br.com.tao.usecase.in.match.CreateMatchUseCase;
import br.com.tao.usecase.in.match.StartMatchUseCase;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class CreateMatchService implements CreateMatchUseCase {

      @Override
      public void createMatch() {
            log.info("CREATING MATCH.");
            log.info("MATCH CREATED.");
      }
}
