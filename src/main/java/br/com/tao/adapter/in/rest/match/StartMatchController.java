package br.com.tao.adapter.in.rest.match;

import br.com.tao.usecase.in.match.StartMatchUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping ("/matches")
@RequiredArgsConstructor
public class StartMatchController {

      private final StartMatchUseCase useCase;

      @PostMapping ("/start")
      public void startMatch() {
            useCase.startMatch();
      }
}
