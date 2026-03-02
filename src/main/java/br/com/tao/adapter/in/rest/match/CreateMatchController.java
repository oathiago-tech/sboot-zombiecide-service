package br.com.tao.adapter.in.rest.match;

import br.com.tao.adapter.in.rest.match.dto.CreateMatchRequestDTO;
import br.com.tao.adapter.mapper.match.CreateMatchMapper;
import br.com.tao.usecase.in.match.CreateMatchUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping ("/match")
@RequiredArgsConstructor
public class CreateMatchController {

      private final CreateMatchUseCase useCase;

      @PostMapping ("/create")
      public void createMatch(@RequestBody CreateMatchRequestDTO request) {
            useCase.createMatch(CreateMatchMapper.toDomain(request));
      }
}
