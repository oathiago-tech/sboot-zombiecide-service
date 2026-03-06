package br.com.tao.application.service.nfc;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import java.io.BufferedInputStream;

@Service
@Slf4j
public class TagReadSoundService {

      private static final String SOUND_RESOURCE = "/sounds/tag-read.wav";

      private Clip clip;

      @PostConstruct
      void init() {
            try (var is = getClass().getResourceAsStream(SOUND_RESOURCE)) {
                  if (is == null) {
                        log.warn("Som de leitura não encontrado no classpath: {}", SOUND_RESOURCE);
                        return;
                  }

                  try (BufferedInputStream bis = new BufferedInputStream(is);
                       AudioInputStream audio = AudioSystem.getAudioInputStream(bis)) {

                        clip = AudioSystem.getClip();
                        clip.open(audio);
                        log.info("Som de leitura carregado: {}", SOUND_RESOURCE);
                  }
            } catch (Exception e) {
                  // Em ambientes sem áudio (Docker/headless), isso pode falhar.
                  log.warn("Não foi possível inicializar áudio para beep de leitura.", e);
                  clip = null;
            }
      }

      public void play() {
            if (clip == null) return;

            try {
                  if (clip.isRunning()) {
                        clip.stop();
                  }
                  clip.setFramePosition(0);
                  clip.start();
            } catch (Exception e) {
                  log.debug("Falha ao tocar som de leitura.", e);
            }
      }

      @PreDestroy
      void shutdown() {
            if (clip != null) {
                  try {
                        clip.close();
                  } catch (Exception ignored) {
                        // no-op
                  } finally {
                        clip = null;
                  }
            }
      }
}