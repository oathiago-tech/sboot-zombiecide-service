package br.com.tao.adapter.in.rest.match;

import br.com.tao.domain.match.model.Match;
import br.com.tao.usecase.in.match.PauseMatchUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/matches")
@RequiredArgsConstructor
public class PauseMatchController {

      private final PauseMatchUseCase pauseMatchUseCase;

      @PostMapping("/pause")
      public ResponseEntity<Match> pause(@RequestParam("match") String matchId) {
            return ResponseEntity.ok(pauseMatchUseCase.pause(matchId));
      }
}