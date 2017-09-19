package com.springboot.service;

import com.springboot.pojo.Products;

import javax.servlet.http.HttpSession;

/**
 * Created by BIG on 2017/9/14.
 */
public interface CartService {
    //购物车加入商品
    public Object insertCartInfo(Products product, HttpSession httpSession);

    //购物车移除商品
    public Object removeCartInfo(Products product, HttpSession httpSession);

    //编辑购物车商品数量
    void editCartInfo(Products product, String bnum, HttpSession httpSession);
}
