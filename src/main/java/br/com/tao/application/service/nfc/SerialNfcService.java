package br.com.tao.application.service.nfc;

import br.com.tao.utils.SerialNfcProperties;
import com.fazecast.jSerialComm.SerialPort;
import com.fazecast.jSerialComm.SerialPortDataListener;
import com.fazecast.jSerialComm.SerialPortEvent;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Service;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicBoolean;

@Service
@Slf4j
@RequiredArgsConstructor
@EnableConfigurationProperties(SerialNfcProperties.class)
public class SerialNfcService {

      private final SerialNfcProperties props;
      private final NfcEventApplicationService nfcEventApplicationService;
      private final TagReadSoundService tagReadSoundService;

      private final AtomicBoolean started = new AtomicBoolean(false);
      private final StringBuilder buffer = new StringBuilder();

      private SerialPort serialPort;

      @PostConstruct
      public void startListening() {
            if (!props.enabled()) {
                  log.info("Serial NFC desabilitado (serial.nfc.enabled=false).");
                  return;
            }

            if (!started.compareAndSet(false, true)) {
                  log.warn("Serial NFC já estava iniciado; ignorando start duplicado.");
                  return;
            }

            serialPort = SerialPort.getCommPort(props.port());
            serialPort.setBaudRate(props.baudRate());

            if (!serialPort.openPort()) {
                  started.set(false);
                  log.error("Erro ao abrir porta serial NFC: {}", props.port());
                  return;
            }

            log.info("Serial NFC conectada: {} (baudRate={})", props.port(), props.baudRate());

            serialPort.addDataListener(new SerialPortDataListener() {

                  @Override
                  public int getListeningEvents() {
                        return SerialPort.LISTENING_EVENT_DATA_AVAILABLE;
                  }

                  @Override
                  public void serialEvent(SerialPortEvent event) {
                        if (event.getEventType() != SerialPort.LISTENING_EVENT_DATA_AVAILABLE) {
                              return;
                        }
                        onDataAvailable();
                  }
            });
      }

      @PreDestroy
      public void stopListening() {
            started.set(false);

            if (serialPort == null) {
                  return;
            }

            try {
                  serialPort.removeDataListener();
            } catch (Exception e) {
                  log.debug("Falha ao remover dataListener da serial NFC.", e);
            }

            try {
                  if (serialPort.isOpen()) {
                        serialPort.closePort();
                  }
            } catch (Exception e) {
                  log.debug("Falha ao fechar porta serial NFC.", e);
            } finally {
                  serialPort = null;
                  buffer.setLength(0);
            }

            log.info("Serial NFC finalizada.");
      }

      private void onDataAvailable() {
            if (!started.get() || serialPort == null) {
                  return;
            }

            int available = serialPort.bytesAvailable();
            if (available <= 0) {
                  return;
            }

            byte[] data = new byte[available];
            int read = serialPort.readBytes(data, data.length);
            if (read <= 0) {
                  return;
            }

            Charset charset = resolveCharset(props.charset());
            String chunk = new String(data, 0, read, charset);
            buffer.append(chunk);

            int idx;
            while ((idx = indexOfLineBreak(buffer)) >= 0) {
                  String rawLine = buffer.substring(0, idx);
                  buffer.delete(0, consumeLineBreak(buffer, idx));

                  String tagId = normalizeTag(rawLine);
                  if (tagId.isEmpty()) {
                        continue;
                  }

                  log.info("TAG NFC recebida: {}", tagId);
                  tagReadSoundService.play();

//                  try {
//                        nfcEventApplicationService.applyNfcEvent(tagId);
//                  } catch (Exception e) {
//                        log.error("Erro ao processar TAG NFC [{}].", tagId, e);
//                  }
            }
      }

      private static String normalizeTag(String rawLine) {
            if (rawLine == null) return "";
            // remove CR e espaços; se seu leitor manda "UID: xxxx", você pode tratar aqui também
            return rawLine.replace("\r", "").trim();
      }

      private static int indexOfLineBreak(StringBuilder sb) {
            for (int i = 0; i < sb.length(); i++) {
                  char c = sb.charAt(i);
                  if (c == '\n' || c == '\r') return i;
            }
            return -1;
      }

      private static int consumeLineBreak(StringBuilder sb, int lineBreakIndex) {
            int end = lineBreakIndex + 1;
            if (end < sb.length()) {
                  char c1 = sb.charAt(lineBreakIndex);
                  char c2 = sb.charAt(end);
                  if ((c1 == '\r' && c2 == '\n') || (c1 == '\n' && c2 == '\r')) {
                        end++;
                  }
            }
            return end;
      }

      private static Charset resolveCharset(String charsetName) {
            if (charsetName == null || charsetName.isBlank()) {
                  return StandardCharsets.UTF_8;
            }
            try {
                  return Charset.forName(charsetName);
            } catch (Exception e) {
                  return StandardCharsets.UTF_8;
            }
      }
}