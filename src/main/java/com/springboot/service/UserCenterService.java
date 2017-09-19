package com.springboot.service;

import com.springboot.pojo.User;

import java.util.List;

/**
 * Created by Administrator on 2017\9\16 0016.
 */
public interface UserCenterService {

   public User findUserCenterById(String userId);

   public void updateUserCenter(User user);
}
