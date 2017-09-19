package com.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by BIG on 2017/9/13.
 */
@Controller
public class LoginoutController {
    @RequestMapping("loginOut")
    public String loginOut(HttpSession session){
        session.removeAttribute("user");
        session.removeAttribute("Cart");
        return  "loginAndRegist/login";
    }
}
