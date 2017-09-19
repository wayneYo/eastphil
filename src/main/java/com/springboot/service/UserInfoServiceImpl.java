package com.springboot.service;

import com.springboot.mapper.UserInfoMapper;
import com.springboot.pojo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by BIG on 2017/9/15.
 */
@Service
public class UserInfoServiceImpl implements  UserInfoService{
    @Autowired
    private UserInfoMapper userInfoMapper;
    public void activeUser(String userId, String activecode){

        userInfoMapper.activeUser(userId, activecode);
    }

    @Override
    public void saveUserInfoByAdmin(UserInfo userInfo) {
        userInfoMapper.saveUserInfoByAdmin(userInfo);
    }

    @Override
    public void updateUserByUserInfo(UserInfo userInfo) {
        userInfoMapper.updateUserByUserInfo(userInfo);
    }

    @Override
    public void deleteUserInfoByIds(String[] userIds) {
        userInfoMapper.deleteUserInfoByIds(userIds);
    }

}
