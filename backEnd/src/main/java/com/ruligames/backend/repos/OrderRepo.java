package com.ruligames.backend.repos;
import com.ruligames.backend.entities.Game;
import com.ruligames.backend.entities.User;
import com.ruligames.backend.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface OrderRepo extends JpaRepository<Order, Integer>{
    public Order findByOrderId(int orderId);
}
