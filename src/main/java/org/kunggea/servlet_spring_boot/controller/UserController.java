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
        System.out.println("  amazon JDK 1.8 can do with \n spring boot 2.7.18");
        System.out.println("  spring boot <version>2.7.18</version>");
        System.out.println("  using Java 1.8.0_392");
        return userService.findAllUser();
    }
}
