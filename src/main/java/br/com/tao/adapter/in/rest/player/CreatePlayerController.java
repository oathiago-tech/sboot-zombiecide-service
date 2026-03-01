package br.com.tao.adapter.in.rest.player;

import br.com.tao.application.service.player.CreatePlayerService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping ("/player")
@RequiredArgsConstructor
public class CreatePlayerController {

      private final CreatePlayerService useCase;

      @PostMapping ("/create")
      public void startMatch() {
            useCase.createPlayer();
      }
}
