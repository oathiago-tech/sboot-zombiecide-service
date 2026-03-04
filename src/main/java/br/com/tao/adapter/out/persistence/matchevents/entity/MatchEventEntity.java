package br.com.tao.adapter.out.persistence.matchevents.entity;

import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.entity.MatchPlayerEntity;
import br.com.tao.application.service.enumeration.EventTypeEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(name = "match_events", schema = "zombicide")
@Getter
@Setter
public class MatchEventEntity {

      @Id
      @GeneratedValue(strategy = GenerationType.UUID)
      private UUID id;

      @ManyToOne(fetch = FetchType.LAZY, optional = false)
      @JoinColumn(name = "match_id", nullable = false)
      private MatchEntity match;

      @ManyToOne(fetch = FetchType.LAZY)
      @JoinColumn(name = "actor_match_player_id")
      private MatchPlayerEntity actor;

      @Enumerated(EnumType.STRING)
      @Column(name = "event_type", nullable = false, length = 50)
      private EventTypeEnum eventType;

      @Column(name = "tag_uid", length = 255)
      private String tagUid;

      @Column(name = "payload", nullable = false, columnDefinition = "jsonb")
      private String payload = "{}";

      @Column(name = "created_at", nullable = false)
      private OffsetDateTime createdAt;
}