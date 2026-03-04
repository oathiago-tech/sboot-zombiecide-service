package br.com.tao.application.service.events;

import br.com.tao.adapter.out.persistence.tag.TagRepositoryAdapter;
import br.com.tao.usecase.in.events.ProcessEventsUseCase;
import br.com.tao.usecase.in.match.GetMatchsUseCase;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProcessEventsService implements ProcessEventsUseCase {

      private final GetMatchsUseCase getMatchsUseCase;
      private final TagRepositoryAdapter tagRepositoryAdapter;

      @Override
      public void processEvents(String body) {
            log.info("PROCESSING EVENT: {}.", body);
            var match = getMatchsUseCase.getActiveMatch();
            if (match == null) {
                  log.info("NO MATCH ACTIVE.");
                  return;
            }

            log.info("MATCH ACTIVE: {}.", match.getId());
            var tag = tagRepositoryAdapter.findTagById(match.getId());
      }
}
