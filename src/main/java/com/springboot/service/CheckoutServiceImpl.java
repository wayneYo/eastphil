package com.springboot.service;

import com.springboot.mapper.CheckoutMapper;
import com.springboot.pojo.Orders;
import com.springboot.pojo.Products;
import com.springboot.pojo.Receiveinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by BIG on 2017/9/16.
 */
@Service
public class CheckoutServiceImpl implements CheckoutService {
    @Autowired
    private CheckoutMapper checkoutMapper;
    @Override
    public void addOrder(Orders order) {
        //为了防止用户使用浏览器后退，然后重复提交相同id订单，先删除
        checkoutMapper.deleteOrder(order.getOrderId());
        checkoutMapper.addOrder(order);
    }

    @Override
    public void addReceive(Receiveinfo receive) {
        checkoutMapper.addReceive(receive);
    }

    @Override
    public void addOrderitem(Orders order, HttpSession session) {
        //从session中获取购物车
        Object cartObj = session.getAttribute("Cart");
        Map<Products,Integer> cart =(Map<Products,Integer>) cartObj;
        for (Map.Entry<Products,Integer> entry : cart.entrySet()) {
            //为了防止用户使用浏览器后退，然后重复提交相同id订单，先删除
            checkoutMapper.deleteOrderitem(order.getOrderId());
            checkoutMapper.addOrderitem(order, entry.getKey().getProductId(), entry.getValue().toString());
        }
    }

    @Override
    public void updateProducts(Orders order, HttpSession session) {
        //从session中获取购物车
        Object cartObj = session.getAttribute("Cart");
        Map<Products,Integer> cart =(Map<Products,Integer>) cartObj;
        for (Map.Entry<Products,Integer> entry : cart.entrySet()) {
            checkoutMapper.updateProducts(order, entry.getKey().getProductId(), entry.getValue().toString());
        }
    }

    @Override
    public void updateOrdersPaystate(String orderId) {
        checkoutMapper.updateOrdersPaystate(orderId);
    }

}
