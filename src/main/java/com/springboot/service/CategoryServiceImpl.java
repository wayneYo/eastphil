package com.springboot.service;


import com.springboot.mapper.CategoryMapper;
import com.springboot.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by BIG on 2017/9/16.
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public List<Category> findAllCate() {
        return categoryMapper.findAllCate();
    }

    @Override
    public Integer findFMcate() {
        return categoryMapper.findFMcate();
    }

    @Override
    public Integer findFDcate() {
        return categoryMapper.findFDcate();
    }

    @Override
    public Integer findLVcate() {
        return categoryMapper.findLVcate();
    }

    @Override
    public Integer findODcate() {
        return categoryMapper.findODcate();
    }
}
