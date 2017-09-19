package com.springboot.controller;

import com.springboot.pojo.User;
import com.springboot.service.UserCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017\9\16 0016.
 */
@Controller
public class UserCenterController extends BaseController {

    @Autowired
    private UserCenterService userCenterService;

    @RequestMapping("/user-center")
    public String findUserCenterById(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user == null){
            return "redirect:/login";
        }
       User userCenterList = userCenterService.findUserCenterById(user.getUserId());
        model.addAttribute("userCenterList",userCenterList);
        return "user-center";
    }


    @RequestMapping("/updateUser-UserInfo")
    public String updateUserCenter(User user){
        userCenterService.updateUserCenter(user);
        return "redirect:/user-center";
    }



}
