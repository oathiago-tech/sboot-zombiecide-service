package br.com.tao.adapter.in.rest.match;

import br.com.tao.adapter.in.rest.match.dto.KillZombiesRequestDTO;
import br.com.tao.application.service.match.KillZombiesService;
import br.com.tao.domain.match.model.Match;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping( "/matches")
@RequiredArgsConstructor
public class KillZombiesController {

      private final KillZombiesService service;

      @PostMapping("/zombies/kill")
      public Match killZombies(@RequestParam ("match") UUID matchId, @RequestBody KillZombiesRequestDTO dto) {
            return service.killZombies(matchId, dto);
      }
}
