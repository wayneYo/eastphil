package com.springboot.controller;

import com.springboot.pojo.ContactMsg;
import com.springboot.service.ContactMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2017\9\13 0013.
 */
@Controller
public class ContactMsgController {


    @Autowired
    private ContactMsgService contactMsgService;

    //提取留言信息
    @RequestMapping("/contactMsgList")
    public String findAll(Model model){
        List<ContactMsg> contactMsgList = contactMsgService.findAll();
        model.addAttribute("contactMsgList" ,contactMsgList);
        return "contactMsgList";
    }

    //存储页面留言信息
    @RequestMapping("/contact-us-home")
    public String saveContactMsg(Model model,ContactMsg contactMsg){
        contactMsgService.saveContactMsg(contactMsg);
        return "home";
    }
}
