package br.com.tao.adapter.out.persistence.item.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "items", schema = "zombicide")
@Getter
@Setter
public class ItemEntity {

      @Id
      @GeneratedValue(strategy = GenerationType.UUID)
      private UUID id;

      @Column(name = "item_name", nullable = false, length = 255)
      private String name;

      @Column(name = "item_description", nullable = false, columnDefinition = "text")
      private String description;
}