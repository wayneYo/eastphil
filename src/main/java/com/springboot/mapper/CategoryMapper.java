package com.springboot.mapper;

import com.springboot.pojo.Category;

import java.util.List;

/**
 * Created by BIG on 2017/9/16.
 */
public interface CategoryMapper {

    public List<Category> findAllCate();

    public Integer findFMcate();

    public Integer findFDcate();

    public Integer findLVcate();

    public Integer findODcate();
}
