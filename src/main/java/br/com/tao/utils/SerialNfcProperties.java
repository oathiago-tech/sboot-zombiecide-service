package br.com.tao.utils;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties (prefix = "serial.nfc")
public record SerialNfcProperties(boolean enabled, String port, Integer baudRate, String charset) {

      public Integer baudRate() {
            return baudRate == null ? 115200 : baudRate;
      }

      public String charset() {
            return charset == null ? "UTF-8" : charset;
      }
}