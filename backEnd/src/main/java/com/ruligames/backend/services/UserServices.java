package com.ruligames.backend.services;

import com.ruligames.backend.entities.User;
import com.ruligames.backend.repos.UsersRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServices {
    @Autowired
    private UsersRepo usersRepo;

    public User getCredentials(String username){
        return buildLogin(usersRepo.findByUsername(username).get(0));
    }

    private User buildLogin(User currentUser){
        User user = getLogin(currentUser);
        return user;
    }

    private User getLogin(User currentUser){
        return User.builder().
                username(currentUser.getUsername()).
                password(currentUser.getPassword()).
                balance(currentUser.getBalance()).
                admin(currentUser.isAdmin()).
                build();
    }

    public User postUser(User user){
        return usersRepo.save(user);
    }
}
