package com.springboot.service;

import com.springboot.mapper.ContactMsgMapper;
import com.springboot.pojo.ContactMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017\9\14 0014.
 */
@Service
public class ContactMsgServiceImpl implements ContactMsgService {
    @Autowired
    private ContactMsgMapper contactMsgMapper;
    @Override
    public List<ContactMsg> findAll() {
        return contactMsgMapper.findAll();
    }

    @Override
    public void saveContactMsg(ContactMsg contactMsg) {
         contactMsgMapper.saveContactMsg(contactMsg);
    }
}
