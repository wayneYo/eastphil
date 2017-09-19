package com.springboot.service;

import com.springboot.mapper.UserCenterMapper;
import com.springboot.mapper.UserInfoMapper;
import com.springboot.mapper.UserMapper;
import com.springboot.pojo.User;
import com.springboot.pojo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017\9\16 0016.
 */
@Service
public class UserCenterServiceImpl implements UserCenterService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserInfoMapper userInfoMapper;
    @Autowired
    private UserCenterMapper userCenterMapper;
    @Override
    public User findUserCenterById(String userId) {
        return userCenterMapper.findUserCenterById(userId);
    }

    @Override
    public void updateUserCenter(User user) {
        userInfoMapper.updateUserInfo(user.getUserInfo());
        userMapper.updateUser(user);
    }
}
