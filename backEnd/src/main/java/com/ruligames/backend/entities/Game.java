package com.ruligames.backend.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Entity
@Table(name = "game")
@Builder
public class Game {
    @Id
    @GeneratedValue
    private int gameId;
    @Column(name = "name")
    private String name;
    @Column(name = "price")
    private float price;
    @Column(name = "publisher_id")
    private int publisherId;
    @Column(name = "genre")
    private  String genre;
}
