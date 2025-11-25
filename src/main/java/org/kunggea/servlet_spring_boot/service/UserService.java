package org.kunggea.servlet_spring_boot.service;


import org.kunggea.servlet_spring_boot.pojo.User;

import java.util.List;

public interface UserService {
    List<User> findAllUser();
}

