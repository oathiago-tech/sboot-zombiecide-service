package br.com.tao.adapter.in.rest.match;

import br.com.tao.adapter.in.rest.match.dto.RevertDamageRequestDTO;
import br.com.tao.domain.match.model.Match;
import br.com.tao.usecase.in.match.RevertDamageUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping ("/matches")
@RequiredArgsConstructor
public class RevertDamageMatchController {

      private final RevertDamageUseCase revertDamageUseCase;

      @PostMapping("/damage/revert")
      public ResponseEntity<Match> revertDamage(
            @RequestParam("match") UUID matchId,
            @RequestBody RevertDamageRequestDTO dto
      ) {
            return ResponseEntity.ok(revertDamageUseCase.revertDamage(matchId, dto));
      }
}