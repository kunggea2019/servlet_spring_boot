package org.kunggea.servlet_spring_boot.controller;

import org.kunggea.servlet_spring_boot.pojo.User;
import org.kunggea.servlet_spring_boot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/findAllUsers")
    public List<User> findAllUser() {
        return userService.findAllUser();
    }
}
