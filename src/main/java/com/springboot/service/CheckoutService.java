package com.springboot.service;

import com.springboot.pojo.Orders;
import com.springboot.pojo.Receiveinfo;

import javax.servlet.http.HttpSession;

/**
 * Created by BIG on 2017/9/16.
 */
public interface CheckoutService {
    //添加订单
    public void addOrder(Orders order);

    //添加收货信息
    public void addReceive(Receiveinfo receive);

    //添加订单商品关联表条目
    public void addOrderitem(Orders order, HttpSession session);

    //更新商品库存
    public void updateProducts(Orders order, HttpSession session);

    //修改订单的支付状态
    void updateOrdersPaystate(String orderId);
}
