package com.ruligames.backend.services;

import com.ruligames.backend.entities.Game;
import com.ruligames.backend.entities.Order;
import com.ruligames.backend.repos.GameRepo;
import com.ruligames.backend.repos.OrderRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class OrderServices {
    @Autowired
    private OrderRepo orderRepo;


    private Order buildOrder(Order currentOrder) {
        Order order = getOrder(currentOrder);
        return order;
    }

    private Order getOrder(Order currentOrder) {
        return Order.builder().
                orderId(currentOrder.getOrderId()).
                buyerUsername(currentOrder.getBuyerUsername()).
                productId(currentOrder.getProductId()).
                build();
    }

    public void postOrder(Order order) {
        orderRepo.save(order);
    }
}