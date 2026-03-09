package br.com.tao.application.service.nfc.domain;

import br.com.tao.application.service.enumeration.DangerLevelEnum;
import br.com.tao.application.service.enumeration.SpawnPointTypeEnum;
import br.com.tao.application.service.enumeration.TurnPhase;
import br.com.tao.application.service.enumeration.ZombieTypeEnum;

import java.time.OffsetDateTime;

public record EventResponseDomain(DangerLevelEnum dangerLevel, SpawnPointTypeEnum spawnPointType, Integer amount,
                                  Integer executionOrder, ZombieTypeEnum type, String cardKey, String cardName,
                                  TurnPhase turnPhase, OffsetDateTime dateTime) {
}
