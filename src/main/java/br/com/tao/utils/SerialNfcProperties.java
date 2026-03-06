package br.com.tao.utils;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "serial.nfc")
public record SerialNfcProperties(
      boolean enabled,
      String port,
      int baudRate,
      String charset
) {
      public SerialNfcProperties {
            if (baudRate == 0) baudRate = 115200;
      }
}