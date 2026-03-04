package br.com.tao.application.service.player;

import br.com.tao.usecase.in.player.CreatePlayerUseCase;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class CreatePlayerService implements CreatePlayerUseCase {

      @Override
      public void createPlayer() {
            log.info("CREATING PLAYER.");
            log.info("PLAYER CREATED.");
      }
}
