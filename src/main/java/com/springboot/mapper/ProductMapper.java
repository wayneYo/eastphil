package com.springboot.mapper;


import com.springboot.pojo.Products;

import java.util.List;

/**
 * Created by BIG on 2017/9/13.
 */
public interface ProductMapper {

    public List<Products> findAllProduct();

    public void deleteByProductId(String productId);

    public Products findProductById(String product);

    public Integer findOhundredNum();

    public Integer findThundredNum();

    public Integer findTHhundredNum();

    public Integer findFhundredNum();

    public Integer findFVhundredNum();

    public Integer findShundredNum();

    public Integer findBhundredNum();

    public void saveAddProduct(Products product);

    public void saveUpdateProduct(Products product);
}
