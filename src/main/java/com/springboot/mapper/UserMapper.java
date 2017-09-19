package com.springboot.mapper;

import com.springboot.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by LYJ on 2017/9/12.
 */
public interface UserMapper {
    public List<User> findAll();
	
	//根据用户名查询用户
    public User findUserByUserName(String userName);

    //新增用户
    public void saveUser(User user);

    void updateUser(User user);

    //后台开始
    public List<User> findAllUser();

    public Integer findAllManUser();

    public Integer findAllWomenUser();

    public Integer findAllUndifidUser();

    public Integer findMonthSale(@Param("date1") String date1, @Param("date2") String date2);

    public User findUserById(String userId);

    public void saveUserByAdmin(User user);

    public void updateUserByUser(User user);

    public void deleteUserByIds(String[] userIds);

    public List<User> findUserByPageNum(@Param("pageNum") Integer pageNum, @Param("everyPage") Integer everyPage);
}
