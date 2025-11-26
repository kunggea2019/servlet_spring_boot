package org.kunggea.servlet_spring_boot.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.kunggea.servlet_spring_boot.pojo.User;
import org.kunggea.servlet_spring_boot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/users")
@Tag(name = "用户管理", description = "用户相关操作接口")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/findAllUsers")
    @Operation(summary = "查询所有用户", description = "获取系统中所有的用户信息")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "成功查询所有用户"),
            @ApiResponse(responseCode = "500", description = "服务器内部错误")
    })
    public List<User> findAllUser() {
        System.out.println("  amazon JDK 1.8 can do with \n spring boot 2.7.18");
        System.out.println("  spring boot <version>2.7.18</version>");
        System.out.println("  using Java 1.8.0_392");
        return userService.findAllUser();
    }

    @GetMapping("/getUserById/{id}")
    @Operation(summary = "根据ID查询用户", description = "根据用户ID获取特定用户信息")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "成功查询用户"),
            @ApiResponse(responseCode = "404", description = "用户不存在"),
            @ApiResponse(responseCode = "500", description = "服务器内部错误")
    })
    public User getUserById(
            @Parameter(description = "用户ID", required = true)
            @PathVariable Long id) {
        return new User(null, "张三", "zhangsan@example.com", 18);
        //todo
//        return userService.getUserById(id);
    }
}
