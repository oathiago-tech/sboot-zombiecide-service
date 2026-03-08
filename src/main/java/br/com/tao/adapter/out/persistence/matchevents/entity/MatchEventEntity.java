package br.com.tao.adapter.out.persistence.matchevents.entity;

import br.com.tao.adapter.out.persistence.match.entity.MatchEntity;
import br.com.tao.adapter.out.persistence.match.entity.MatchPlayerEntity;
import br.com.tao.application.service.enumeration.EventTypeEnum;
import com.fasterxml.jackson.databind.JsonNode;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Data
@Builder
@Table (name = "match_events", schema = "zombicide")
@AllArgsConstructor
@NoArgsConstructor
public class MatchEventEntity {

      @Id
      @GeneratedValue (strategy = GenerationType.UUID)
      private UUID id;

      @ManyToOne (fetch = FetchType.LAZY, optional = false)
      @JoinColumn (name = "match_id", nullable = false)
      private MatchEntity match;

      @ManyToOne (fetch = FetchType.LAZY)
      @JoinColumn (name = "actor_match_player_id")
      private MatchPlayerEntity actor;

      @Enumerated (EnumType.STRING)
      @JdbcTypeCode (SqlTypes.NAMED_ENUM)
      @Column (name = "event_type", nullable = false, length = 50)
      private EventTypeEnum eventType;

      @Column (name = "tag_uid", length = 255)
      private String tagUid;

      @JdbcTypeCode (SqlTypes.JSON)
      @Column (name = "payload", nullable = false, columnDefinition = "jsonb")
      private JsonNode payload;

      @Column (name = "created_at", nullable = false)
      private OffsetDateTime createdAt;
}