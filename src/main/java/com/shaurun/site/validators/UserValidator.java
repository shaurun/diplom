package com.shaurun.site.validators;

import com.shaurun.site.model.User;
import com.shaurun.site.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Validator for {@link com.shaurun.site.model.User} class,
 * implements {@link Validator} interface
 *
 * @author Alena Damanskaya
 * @version 1.0
 */
@Component
public class UserValidator implements Validator{

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "Required");

        if(userService.findByUsername(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Required");

        if(!user.getConfirmPassword().equals(user.getPassword())){
            errors.rejectValue("password", "Password.unconfirmed");
        }
    }
}
