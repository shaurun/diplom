package com.shaurun.site.services;

import com.shaurun.site.model.User;

/**
 * Service classe for {@link com.shaurun.site.model.User}
 *
 * @author Alena Damanskaya
 * @version 1.0
 */
public interface UserService {

    void save(User user);

    User findByUsername(String username);
}
