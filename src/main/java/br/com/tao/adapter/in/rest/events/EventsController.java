package br.com.tao.adapter.in.rest.events;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping ("/events")
@Slf4j
public class EventsController {

      @PostMapping ("/create")
      public void createEvent(@RequestBody String body) {
           log.info("EVENT: {}", body);
      }

      @PostMapping ("")
      public void processEvent(@RequestBody String body) {
            log.info("EVENT: {}", body);
      }
}
