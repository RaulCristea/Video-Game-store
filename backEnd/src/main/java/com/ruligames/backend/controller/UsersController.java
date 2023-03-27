package com.ruligames.backend.controller;

import com.ruligames.backend.entities.User;
import com.ruligames.backend.repos.UsersRepo;
import com.ruligames.backend.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/homepage")
public class UsersController {
    @Autowired
    private UserServices userServices;
    @GetMapping("/getUser/{username}")
    public ResponseEntity<User> getUser(@PathVariable(name = "username") String username){

        User user = userServices.getCredentials(username);
        try{
            return new ResponseEntity<>(
              user,
                    HttpStatus.OK
            );
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/signup")
    public ResponseEntity<User> registerUser(@RequestBody User user){
        try{
            return new ResponseEntity<>(
                    userServices.postUser(user),
                    HttpStatus.OK
            );
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}