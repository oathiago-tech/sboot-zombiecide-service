package br.com.tao.application.service.nfc.domain;

import br.com.tao.application.service.enumeration.*;

import java.time.OffsetDateTime;

public record EventResponseDomain(DangerLevelEnum dangerLevel, SpawnPointTypeEnum spawnPointType, Integer amount,
                                  Integer executionOrder, ZombieTypeEnum type, String cardKey, String cardName,
                                  TurnPhase turnPhase, OffsetDateTime dateTime, String characterKey,
                                  EventTypeEnum eventType) {
}
