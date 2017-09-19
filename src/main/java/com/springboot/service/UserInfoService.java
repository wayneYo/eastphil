package com.springboot.service;

import com.springboot.pojo.UserInfo;

/**
 * Created by BIG on 2017/9/15.
 */
public interface UserInfoService {
    //激活用户帐号
    public void activeUser(String userId, String activecode);

    public void saveUserInfoByAdmin(UserInfo userInfo);

    public void updateUserByUserInfo(UserInfo userInfo);

    public void deleteUserInfoByIds(String[] userIds);
}
