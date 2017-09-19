package com.springboot.service;


import com.springboot.pojo.Products;

import java.util.List;

/**
 * Created by BIG on 2017/9/13.
 */

public interface ProductService {


    public void deleteByProductId(String productId);

    public List<Products> findAllProduct();

    public Products findProductById(String productId);

    public void saveAddProduct(Products product);


    public Integer findOhundredNum();

    public Integer findThundredNum();

    public Integer findTHhundredNum();

    public Integer findFhundredNum();

    public Integer findFVhundredNum();

    public Integer findShundredNum();

    public Integer findBhundredNum();

    public void saveUpdateProduct(Products product);
}
