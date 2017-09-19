package com.springboot.pojo;

import java.util.Date;
import java.util.Objects;

/**
 * Created by WEN on 2017/9/13.
 */
/*create table PRODUCTS
(
   product_id           varchar(100) not null,
   name                 varchar(50),
   price                double,
   size                 varchar(100),
   pnum                 int(11),
   category             varchar(255),
   imgurl               varchar(255),
   description          varchar(255),
   primary key (product_id)
);*/
public class Products {

    private static final long serialVersionUID = 8892829278010395419L;

    private String productId;
    private String productName;
    private Double price;
    private String size;
    private Integer pnum;
    private Category category;
    private String imgurl;
    private String description;
    private String presentation;
    private Double oldprice;
    private Integer state;
    private Date crateTime;

    public Date getCrateTime() {
        return crateTime;
    }

    public void setCrateTime(Date crateTime) {
        this.crateTime = crateTime;
    }

    public String getProductId() {
        return productId;
    }
    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getPrice() {
        return price;
    }
    public void setPrice(Double price) {
        this.price = price;
    }
    public String getSize() {
        return size;
    }
    public void setSize(String size) {
        this.size = size;
    }
    public Integer getPnum() {
        return pnum;
    }
    public void setPnum(Integer pnum) {
        this.pnum = pnum;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getImgurl() {
        return imgurl;
    }
    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public String getPresentation() {
        return presentation;
    }

    public void setPresentation(String presentation) {
        this.presentation = presentation;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Double getOldprice() {
        return oldprice;
    }

    public void setOldprice(Double oldprice) {
        this.oldprice = oldprice;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Products)) return false;
        Products products = (Products) o;
        return Objects.equals(productId, products.productId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(productId);
    }
}


