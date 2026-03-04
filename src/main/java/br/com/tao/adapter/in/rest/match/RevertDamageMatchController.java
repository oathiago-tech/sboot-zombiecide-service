package br.com.tao.adapter.in.rest.match;

import br.com.tao.domain.match.model.Match;
import br.com.tao.usecase.in.match.RevertDamageUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/matches")
@RequiredArgsConstructor
public class RevertDamageMatchController {

      private final RevertDamageUseCase revertDamageUseCase;

      @PostMapping("/damage/revert")
      public ResponseEntity<Match> revert(@RequestParam("event") String damageEventId) {
            return ResponseEntity.ok(revertDamageUseCase.revert(damageEventId));
      }
}