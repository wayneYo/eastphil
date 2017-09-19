package com.springboot.service;

import com.springboot.pojo.User;

import java.util.List;

/**
 * Created by LYJ on 2017/9/12.
 */
public interface UserService {
    public List<User> findAll();
	//根据用户名查询用户
    public User findUserByUserName(String userName);
    //新增用户
    public void saveUser(User user);


    //后台开始
    public List<User> findAllUser();

    public Integer findAllManUser();

    public Integer findAllWomenUser();

    public Integer findAllUndifidUser();

    public Integer findMonthSale(String date1, String date2);

    public User findUserById(String userId);

    public void saveUserByAdmin(User user);

    public void updateUserByUser(User user);

    public void deleteUserByIds(String[] userIds);

    public List<User> findUserByPageNum(Integer pageNum, Integer everyPage);
}
