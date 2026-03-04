package br.com.tao.adapter.in.rest.events;

import br.com.tao.application.service.nfc.NfcEventApplicationService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/events")
@Slf4j
@RequiredArgsConstructor
public class EventsController {

      private final NfcEventApplicationService nfcEventApplicationService;

      @PostMapping("/nfc")
      public ResponseEntity<Void> nfc(@RequestBody NfcEventRequest request) {
            log.info("NFC EVENT: type={}", request.getEventType());
            nfcEventApplicationService.applyNfcEvent(request.getEventType());
            return ResponseEntity.noContent().build();
      }

      @PostMapping("/create")
      public void createEvent(@RequestBody String body) {
            log.info("EVENT: {}", body);
      }

      @PostMapping("")
      public void processEvent(@RequestBody String body) {
            log.info("EVENT: {}", body);
      }

      @Data
      public static class NfcEventRequest {
            private String eventType;
      }
}