package com.springboot.mapper;

import com.springboot.pojo.User;
import com.springboot.pojo.UserInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Value;

import java.util.List;

/**
 * Created by LYJ on 2017/9/12.
 */
public interface UserInfoMapper {

    //新增用户
    public void saveUserInfo(UserInfo userInfo);
    //激活用户
    @Update("update user_info set statment='1' where user_info_id=#{userId} and activecode=#{activecode}")
    void activeUser(@Param(value = "userId") String userId, @Param(value = "activecode") String activecode);

    void updateUserInfo(UserInfo userInfo);

    //后台开始
    public void saveUserInfoByAdmin(UserInfo userInfo);

    public void updateUserByUserInfo(UserInfo userInfo);

    public void deleteUserInfoByIds(String[] userIds);


}
