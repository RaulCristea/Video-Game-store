package com.ruligames.backend.entities;

import jakarta.persistence.*;
import lombok.*;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Entity
@Table(name = "`order`")
@Builder
@Setter
public class Order {
    @Id
    @GeneratedValue
    private int orderId;
    @Column(name = "buyer_username")
    private String buyerUsername;
    @Column(name = "product_id")
    private int productId;
}
