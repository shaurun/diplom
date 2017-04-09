package com.shaurun.site.services;

import com.shaurun.site.dao.RoleDao;
import com.shaurun.site.dao.UserDao;
import com.shaurun.site.model.Role;
import com.shaurun.site.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Implementation of {@link UserService}
 *
 * @author Alena Damanskaya
 * @version 1.0
 */

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Set<Role> roles = new HashSet<>();
        roles.add(roleDao.findOne(1L));
        user.setRoles(roles);
        userDao.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public List<User> listUsers() {
        return userDao.findAll();
    }

    @Override
    public User findById(long id) {
        return userDao.getOne(id);
    }

    @Override
    public void removeAdminRole(User user) {
        System.out.println("--------------------");
        Set<Role> roles = new HashSet<>();
        roles.add(roleDao.findOne(1L));
        user.setRoles(roles);
        userDao.save(user);
    }

    @Override
    public void addAdminRole(User user) {
        Set<Role> roles = user.getRoles();
        roles.add(roleDao.findOne(2L));
        user.setRoles(roles);
        userDao.save(user);
    }

    @Override
    public Role getAdminRole() {
        Role admin = new Role();
        admin.setId(2L);
        admin.setName("ROLE_ADMIN");
        return admin;
    }
}
