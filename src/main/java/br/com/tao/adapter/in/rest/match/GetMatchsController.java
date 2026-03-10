package br.com.tao.adapter.in.rest.match;

import br.com.tao.domain.match.model.Match;
import br.com.tao.usecase.in.match.GetMatchsUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping ("/matches")
@RequiredArgsConstructor
public class GetMatchsController {

      private final GetMatchsUseCase useCase;

      @GetMapping ("/all")
      public ResponseEntity<List<Match>> getAllMatchs() {
            return ResponseEntity.ok().body(useCase.getMatchs());
      }

      @GetMapping("/{matchId}")
      public Match getMatch(@PathVariable UUID matchId) {
            return useCase.getMatch(matchId);
      }
}
