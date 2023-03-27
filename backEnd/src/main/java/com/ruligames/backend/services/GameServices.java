package com.ruligames.backend.services;

import com.ruligames.backend.entities.Game;
import com.ruligames.backend.repos.GameRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class GameServices {
    @Autowired
    private GameRepo gameRepo;

    private Game buildGame(Game currentGame) {
        Game game = getGame(currentGame);
        return game;
    }

    private Game getGame(Game currentGame) {
        return Game.builder().
                gameId(currentGame.getGameId()).
                name(currentGame.getName()).
                price(currentGame.getPrice()).
                publisherId(currentGame.getPublisherId()).
                genre(currentGame.getGenre()).
                build();
    }

    public Game postGame(Game game) {
        gameRepo.save(game);
        return  game;
    }
}