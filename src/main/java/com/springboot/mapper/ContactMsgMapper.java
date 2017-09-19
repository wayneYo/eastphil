package com.springboot.mapper;

import com.springboot.pojo.ContactMsg;

import java.util.List;

/**
 * Created by Administrator on 2017\9\14 0014.
 */

public interface ContactMsgMapper {
    public List<ContactMsg> findAll();

    public void saveContactMsg(ContactMsg contactMsg);
}
