package com.shaurun.site.dao;

import com.shaurun.site.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<User, Long>{
    User findByUsername(String username);
}
