package com.springboot.pojo;

/**
 * Created by WEN on 2017/9/13.
 */

/*create table orderitem
(
   order_id             varchar(100) not null default '',
   product_id           varchar(100),
   buynum               int(11),
   primary key (order_id)
);*/
public class OrderItem {
    private static final long serialVersionUID=2649892275136890231L;

    private String orderId;
    private String productId;
    private Integer buynum;

    public String getOrderId() {

        return orderId;
    }

    public void setOrderId(String orderId) {

        this.orderId = orderId;
    }

    public String getProductId() {

        return productId;
    }

    public void setProductId(String productId) {

        this.productId = productId;
    }

    public Integer getBuynum() {

        return buynum;
    }

    public void setBuynum(Integer buynum) {

        this.buynum = buynum;
    }


}
