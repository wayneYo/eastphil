package com.springboot.pojo;

/**
 * Created by BIG on 2017/9/15.
 */
public class Category {
    private String cateId;
    private String cateName;
    private Integer productNum;
    private String cateColor;
    private String picture;

    public Integer getProductNum() {
        return productNum;
    }

    public void setProductNum(Integer productNum) {
        this.productNum = productNum;
    }

    public String getCateId() {
        return cateId;
    }

    public void setCateId(String cateId) {
        this.cateId = cateId;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public String getCateColor() {
        return cateColor;
    }
    public void setCateColor(String cateColor) {
        this.cateColor = cateColor;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
}
