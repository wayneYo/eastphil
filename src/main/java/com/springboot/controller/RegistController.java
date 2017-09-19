package com.springboot.controller;

import com.springboot.pojo.User;
import com.springboot.service.UserInfoService;
import com.springboot.service.UserService;
import com.springboot.tool.EmailTool;
import com.springboot.tool.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by BIG on 2017/9/13.
 */
@Controller
public class RegistController {

    @Autowired
    private UserService userService;
	@Autowired
    private UserInfoService userInfoService;

    @RequestMapping("/regist")
    public  String login(){
        return  "loginAndRegist/regist";
    }

    @RequestMapping("/toRegist")
    public String toRegist(User user, Model model, String valistr, HttpSession session){
        User u = userService.findUserByUserName(user.getUsername());
        if (u != null){
            model.addAttribute("errorInfo", "用户名已被占用");
            return "loginAndRegist/regist";
        }
        String va = (String) session.getAttribute("code");
        if (! va.toUpperCase().equals(valistr.toUpperCase())){
            model.addAttribute("errorInfo", "验证码不正确");
            return "loginAndRegist/regist";
        }
        //保存用户信息
        userService.saveUser(user);
        //给用户邮箱发送验证消息
        try {
             EmailTool.send(user.getEmail(), user.getUserId(), user.getUserInfo().getActivecode());
            return "redirect:/login";
        }catch (MessagingException e){
            e.printStackTrace();
            model.addAttribute("errorInfo", "验证邮件发送失败");
            return "loginAndRegist/regist";
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

    //ajax验证用户名是否存在
    @RequestMapping("/ajaxCheckUsername")
    public void ajaxCheckUsername(String username,HttpServletResponse response){
        response.setContentType("html/css;charset=utf-8");

        if("".equals(username)|| username == null){
            try {
                response.getWriter().write("");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return;
        }

        if(userService.findUserByUserName(username) != null){
            try {
                response.getWriter().write("用户名已存在");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            try {
                response.getWriter().write("恭喜，用户名可以使用");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping("/verifyCode")
    public void verifyCode(HttpServletResponse response, HttpSession session){
        response.setDateHeader("Expires", -1);
        response.setHeader("Cache-Control", "no-cache");

        VerifyCode vc = new VerifyCode();
        try {
            vc.drawImage(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
        String code = vc.getCode();
        session.setAttribute("code", code);
        System.out.println(code);

    }
	
	@RequestMapping("activeUser")
    @ResponseBody
    public void activeUser(String userId, String activecode, HttpServletResponse response){
        userInfoService.activeUser(userId, activecode);
        // 定时刷新
        response.setContentType("text/html;charset=utf-8");
        try {
            response.getWriter().write("激活成功，3秒之后回到登录界面进行登录...");
            response.setHeader("refresh", "3;url=/login");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
