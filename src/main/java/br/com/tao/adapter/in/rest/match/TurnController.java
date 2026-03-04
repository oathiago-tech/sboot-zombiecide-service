package br.com.tao.adapter.in.rest.match;

import br.com.tao.application.service.match.AdvanceTurnService;
import br.com.tao.domain.match.model.Match;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping ("/matches")
@RequiredArgsConstructor
public class TurnController {

      private final AdvanceTurnService advanceTurnService;

      @PostMapping ("/turn/next")
      public ResponseEntity<Match> nextTurn() {
            return ResponseEntity.ok(advanceTurnService.nextTurn());
      }
}