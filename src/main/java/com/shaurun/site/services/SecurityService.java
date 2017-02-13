package com.shaurun.site.services;

/**
 * Service for security
 *
 * @author Alena Damanskaya
 * @version 1.0
 */
public interface SecurityService {
    String findLoggedInUsername();

    void autoLogin(String username, String password);

}
