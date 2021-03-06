package com.shaurun.site.controllers;

import com.shaurun.site.model.Role;
import com.shaurun.site.model.User;
import com.shaurun.site.services.SecurityService;
import com.shaurun.site.services.UserService;
import com.shaurun.site.validators.UserValidator;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Set;

/**
 * Controller for {@link com.shaurun.site.model.User}'s pages.
 *
 * @author Alena Damanskaya
 * @version 1.0
 */

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String listUsers(Model model) {
        model.addAttribute("listUsers", userService.listUsers());
        model.addAttribute("adminRole", userService.getAdminRole());
        return "users";
    }

    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public String setRole(Model model,
                          @RequestParam(value = "username", required = true) String username,
                          @RequestParam(value = "curAdmin", required = true) boolean userHasAdminRole) {
        User user = userService.findByUsername(username);
        System.out.println(username);
        //System.out.println(user);
        if (userHasAdminRole) {
            userService.removeAdminRole(user);
        } else {
            userService.addAdminRole(user);
        }

        return "redirect:/users";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userform", new User());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userform") User userform, BindingResult bindingResult, Model model) {
        userValidator.validate(userform, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userService.save(userform);
        securityService.autoLogin(userform.getUsername(), userform.getConfirmPassword());
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect");
        }
        if (logout != null) {
            model.addAttribute("message", "Logged out successfully");
            return "redirect:/welcome";
        }
        return "login";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        return "admin";
    }
}
