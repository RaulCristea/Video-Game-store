package com.ruligames.backend.controller;

import com.ruligames.backend.entities.Game;
import com.ruligames.backend.repos.GameRepo;
import com.ruligames.backend.services.GameServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/homepage")
public class GameController {
    @Autowired
    private GameServices gameServices;

    @Autowired
    private GameRepo gameRepo;

    @GetMapping("/getGames")
    public List<Game> getAllGames() {
        return gameRepo.findAll();
    }

    @PostMapping("/gameregister")
    public ResponseEntity<Game> registerGame(@RequestBody Game game) {
        try {
            gameServices.postGame(game);
            return new ResponseEntity<>(
                    game,
                    HttpStatus.OK
            );
        } catch (Exception e) {
            return new ResponseEntity<>(null,HttpStatus.NOT_FOUND);
        }
    }
}
