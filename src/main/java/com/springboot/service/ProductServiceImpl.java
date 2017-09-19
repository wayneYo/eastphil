package com.springboot.service;

import com.springboot.mapper.ProductMapper;

import com.springboot.pojo.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by BIG on 2017/9/13.
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Products> findAllProduct() {
        return productMapper.findAllProduct();
    }

    @Override
    public Products findProductById(String productId) {
        return productMapper.findProductById(productId);
    }

    @Override
    public void saveAddProduct(Products product) {
        productMapper.saveAddProduct(product);
    }

    @Override
    public Integer findOhundredNum() {
        return productMapper.findOhundredNum();
    }

    @Override
    public Integer findThundredNum() {
        return productMapper.findThundredNum();
    }

    @Override
    public Integer findTHhundredNum() {
        return productMapper.findTHhundredNum();
    }

    @Override
    public Integer findFhundredNum() {
        return productMapper.findFhundredNum();
    }

    @Override
    public Integer findFVhundredNum() {
        return productMapper.findFVhundredNum();
    }

    @Override
    public Integer findShundredNum() {
        return productMapper.findShundredNum();
    }

    @Override
    public Integer findBhundredNum() {
        return productMapper.findBhundredNum();
    }

    @Override
    public void saveUpdateProduct(Products product) {
        productMapper.saveUpdateProduct(product);
    }


    @Override
    public void deleteByProductId(String productId) {
        productMapper.deleteByProductId(productId);
    }

}
