package com.shaurun.site.services;

import com.shaurun.site.model.Role;
import com.shaurun.site.model.User;

import java.util.List;

/**
 * Service classe for {@link com.shaurun.site.model.User}
 *
 * @author Alena Damanskaya
 * @version 1.0
 */
public interface UserService {

    void save(User user);

    User findByUsername(String username);

    List<User> listUsers();

    User findById(long id);

    void removeAdminRole(User user);

    void addAdminRole(User user);

    Role getAdminRole();
}
