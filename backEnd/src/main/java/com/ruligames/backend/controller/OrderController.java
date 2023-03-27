package com.ruligames.backend.controller;
import com.ruligames.backend.entities.Game;
import com.ruligames.backend.entities.Order;
import com.ruligames.backend.entities.User;
import com.ruligames.backend.repos.GameRepo;
import com.ruligames.backend.repos.OrderRepo;
import com.ruligames.backend.repos.UsersRepo;
import com.ruligames.backend.services.OrderServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/homepage")
public class OrderController {
    @Autowired
    private OrderServices orderServices;
    @Autowired
    private GameRepo gameRepo;
    @Autowired
    private UsersRepo usersRepo;
    @Autowired
    private OrderRepo orderRepo;

    @PostMapping("/orderregister")
    public ResponseEntity<Order> registerOrder(@RequestBody Order order) {
        try {
            Game product= gameRepo.findByGameId(order.getProductId());
            User user= usersRepo.findByUsername(order.getBuyerUsername()).get(0);
            user.setBalance(user.getBalance()-product.getPrice());
            usersRepo.save(user);
            orderServices.postOrder(order);
            return new ResponseEntity<>(
                    order,
                    HttpStatus.OK
            );
        } catch (Exception e) {
            return new ResponseEntity<>(null,HttpStatus.NOT_FOUND);
        }
    }
}
