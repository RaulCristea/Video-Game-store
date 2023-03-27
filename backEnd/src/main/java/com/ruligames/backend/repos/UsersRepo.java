package com.ruligames.backend.repos;

import com.ruligames.backend.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UsersRepo extends JpaRepository<User, String> {
    public List<User> findByUsername(String username);
}
