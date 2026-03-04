package br.com.tao.adapter.out.persistence.match.entity;

import br.com.tao.adapter.out.persistence.item.entity.ItemEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(
      name = "match_player_items",
      schema = "zombicide",
      uniqueConstraints = {
            @UniqueConstraint(
                  name = "ux_mpi_unique_item_per_player",
                  columnNames = {"match_player_id", "item_id"}
            )
      }
)
@Getter
@Setter
public class MatchPlayerItemEntity {

      @Id
      @GeneratedValue(strategy = GenerationType.UUID)
      private UUID id;

      @ManyToOne(fetch = FetchType.LAZY, optional = false)
      @JoinColumn(name = "match_player_id", nullable = false)
      private MatchPlayerEntity matchPlayer;

      @ManyToOne(fetch = FetchType.LAZY, optional = false)
      @JoinColumn(name = "item_id", nullable = false)
      private ItemEntity item;

      @Column(name = "acquired_at", nullable = false)
      private OffsetDateTime acquiredAt;
}