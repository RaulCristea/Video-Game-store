package com.ruligames.backend.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Entity
@Table(name = "users")
@Builder
@Setter
public class User {
    @Id
    private String username;
    @Column(name = "password")
    private String password;
    @Column(name = "balance")
    private float balance;
    @Column(name = "admin")
    private boolean admin;
}
