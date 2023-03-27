package com.ruligames.backend.repos;

import com.ruligames.backend.entities.Game;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GameRepo extends JpaRepository<Game, Integer>{
    public Game findByGameId(int gameId);
}
