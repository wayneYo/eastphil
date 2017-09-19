package com.springboot.controller.back;

import com.alibaba.fastjson.JSONArray;
import com.springboot.pojo.User;
import com.springboot.pojo.UserDownloadModel;
import com.springboot.service.UserService;
import com.springboot.tool.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by BIG on 2017/9/14.
 */
@Controller
@RequestMapping("/back")
public class BackUserController extends BaseController{

    @Autowired
    private UserService userService;
    @RequestMapping("/user")
    public String toBackUser(Integer pageNum,Model model) {

        List<User> userList = userService.findAllUser();
        //定义数据库分多少页
        Integer pageNums = 0;

        //定义每页显示多少条数据
        Integer everyPage = 30;

        Integer userListLength = userList.size();
        System.out.print(userListLength);
        if(userListLength%everyPage ==0){
            pageNums = userListLength/everyPage;
        }else{
            pageNums = userListLength/everyPage+1;
        }

        if(pageNum == null || pageNum<0 || pageNum>(pageNums-1)){
            pageNum = 0;
        }

        List<User> pageUserList = userService.findUserByPageNum(pageNum,everyPage);
        model.addAttribute("pageUserList",pageUserList);

        //将第多少页打过去，用户排序号
        model.addAttribute("pageNum",(pageNum+1));
        model.addAttribute("pageNums",pageNums);
        model.addAttribute("everyPage",everyPage);

        return "/back/user/userList";
    }

    @RequestMapping("/toViewUser")
    public String toView(String userId,Model model){
        User user = userService.findUserById(userId);
        model.addAttribute("user",user);
        return "/back/user/userView";
    }

    @RequestMapping("/toCreateUser")
    public String toCreate(){
        return "/back/user/userCreate";
    }


    @RequestMapping("/toSave")
    public String toSave(User user){
        userService.saveUserByAdmin(user);
        return "redirect:/back/user";
    }

    @RequestMapping("/toUpdateUser")
    public String toUpdate(String userId,Model model){
        User user = userService.findUserById(userId);
        model.addAttribute("user",user);
        return "/back/user/userUpdate";
    }
    @RequestMapping("/updateUser")
    public String updateUser(User user){
        userService.updateUserByUser(user);
        return "redirect:/back/user";
    }


    @RequestMapping("/toDeleteUser")
    public String toDelete(@RequestParam("userId")String[] userIds){
        userService.deleteUserByIds(userIds);
        return "redirect:/back/user";
    }

    //打印用户列表数据
    @RequestMapping("/downloadUserList")
    public void downloadUserList(HttpServletResponse response) throws IOException {
        List<User> userList = userService.findAllUser();
        String title = "用户列表";

        JSONArray ja = new JSONArray();
        int index = 0;
        for (User user : userList){
            index ++;
            UserDownloadModel model = new  UserDownloadModel();
            model.setNum(index+"");
            model.setPhonenumber(user.getPhonenumber());
            model.setEmail(user.getEmail());
            model.setUserId(user.getUserId());
            model.setUsername(user.getUsername());
            System.out.println(model.getNum());
            if (user.getUserInfo() != null && user.getUserInfo().getGender() != null){
                model.setSex(user.getUserInfo().getGender());
            }else {
                model.setSex("");
            }
            ja.add(model);
        }

        Map<String,String> headMap = new LinkedHashMap<String,String>();
        headMap.put("num","序号");
        headMap.put("userId","用户ID");
        headMap.put("username","用户名");
        headMap.put("email","邮箱");
        headMap.put("phonenumber","电话号码");
        headMap.put("sex","性别");


        OutputStream outXlsx = new FileOutputStream("d://用户列表.xlsx");
        System.out.println("正在导出xlsx....");
        Date d2 = new Date();
        ExcelUtil.downloadExcelFile(title, headMap, ja, response);
        System.out.println("共"+index+"条数据,执行"+(new Date().getTime()-d2.getTime())+"ms");
        outXlsx.close();
    }




}
