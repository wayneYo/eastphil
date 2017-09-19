package com.springboot.service;

import com.springboot.mapper.UserInfoMapper;
import com.springboot.mapper.UserMapper;
import com.springboot.pojo.User;
import com.springboot.pojo.UserInfo;
import com.springboot.tool.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by LYJ on 2017/9/12.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired    //userMapper对象应该由spring创建
    private UserMapper userMapper;
    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    private UserInfoService userInfoService;

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    public User findUserByUserName(String userName){
        return userMapper.findUserByUserName(userName);
    }

    @Override
    public void saveUser(User user) {
       //如果没有userInfo对象 创建一个
        if (user.getUserInfo() == null){
            user.setUserInfo( new UserInfo());
        }
        //默认注册的都是用户
        user.getUserInfo().setUserLevel(1);
        //创建用户id
        user.setUserId(UUID.randomUUID().toString());
        //设置用户详情表id
        user.getUserInfo().setUserInfoId(user.getUserId());
        user.getUserInfo().setStatment("0");
        //创建激活码
        String activecode = MD5Utils.md5(UUID.randomUUID().toString());
        user.getUserInfo().setActivecode(activecode);
        userMapper.saveUser(user);
        if (user.getUserInfo() != null){
            userInfoMapper.saveUserInfo(user.getUserInfo());
        }
    }


    //后台开始
    @Override
    public List<User> findAllUser() {
        return userMapper.findAllUser();
    }

    @Override
    public Integer findAllManUser() {
        return userMapper.findAllManUser();
    }

    @Override
    public Integer findAllWomenUser() {
        return userMapper. findAllWomenUser();
    }

    @Override
    public Integer findAllUndifidUser() {
        return userMapper.findAllUndifidUser();
    }

    @Override
    public Integer findMonthSale(String date1, String date2) {
        return userMapper.findMonthSale(date1,date2);
    }

    @Override
    public User findUserById(String userId) {
        return userMapper.findUserById(userId);
    }

    @Override
    public void saveUserByAdmin(User user) {
        UserInfo userInfo = user.getUserInfo();
        user.setUserId(UUID.randomUUID().toString());
        userInfo.setUserInfoId(user.getUserId());
        userInfo.setJoinDate(new Date());
        userMapper.saveUser(user);
        userInfoService.saveUserInfoByAdmin(userInfo);

    }

    @Override
    public void updateUserByUser(User user) {
        UserInfo userInfo = user.getUserInfo();
        userInfo.setUserInfoId(user.getUserId());
        userMapper.updateUserByUser(user);
        userInfoService.updateUserByUserInfo(userInfo);
    }

    @Override
    public void deleteUserByIds(String[] userIds) {
        userInfoService.deleteUserInfoByIds(userIds);
        userMapper.deleteUserByIds(userIds);
    }

    @Override
    public List<User> findUserByPageNum(Integer pageNum, Integer everyPage) {
        return userMapper.findUserByPageNum(pageNum, everyPage);
    }
}
