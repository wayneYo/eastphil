package com.springboot.controller;

import com.springboot.pojo.User;
import com.springboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by LYJ on 2017/9/12.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/findAll")
    public String findAll(Model model){

        List<User> userList = userService.findAll();
        model.addAttribute("userList",userList);
        //经过视图解析器跳转页面
        return  "userList";
    }
}
