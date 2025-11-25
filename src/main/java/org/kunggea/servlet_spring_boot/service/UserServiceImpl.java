package org.kunggea.servlet_spring_boot.service;

import org.kunggea.servlet_spring_boot.mapper.UserMapper;
import org.kunggea.servlet_spring_boot.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> findAllUser() {
        return userMapper.findAllUser();
    }
}

