package br.com.tao.application.service.nfc.domain;

import br.com.tao.application.service.enumeration.DangerLevelEnum;
import br.com.tao.application.service.enumeration.SpawnPointTypeEnum;
import br.com.tao.application.service.enumeration.ZombieTypeEnum;

public record ZombieRespawnPayloadDomain(DangerLevelEnum dangerLevel, SpawnPointTypeEnum spawnPointType, Integer amount,
                                         Integer executionOrder, ZombieTypeEnum type, String cardKey, String cardName) {
}
