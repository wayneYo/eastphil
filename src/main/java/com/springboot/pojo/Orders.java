package com.springboot.pojo;

/**
 * Created by WEN on 2017/9/13.
 */

import java.util.Date;

/*create table orders
(
   order_id             varchar(100) not null,
   moneyInfo                double,
   paystate             int(11) default NULL,
   ordertime            timestamp not null,
   user_id              varchar(40) default NULL,
   primary key (order_id),
   key user_id (user_id)
);
*/
public class Orders {
    private static final long serialVersionUID = 6651134964328474822L;
    //封装订单收货地址，方便展示出订单详情，一对一
    private String receiveId;
    private String orderId;
    private Double money;
    private Integer paystate;
    private Date ordertime;
    private String userId;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getReceiveId() {
        return receiveId;
    }

    public void setReceiveId(String receiveId) {
        this.receiveId = receiveId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Integer getPaystate() {
        return paystate;
    }

    public void setPaystate(Integer paystate) {
        this.paystate = paystate;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}

