package com.springboot.pojo;

/**
 * Created by BIG on 2017/9/15.
 */

/*create table receiveinfo
        (
        receive_id           varchar(100) not null,
        user_id              varchar(40),
        order_id             varchar(100),
        receive_name         varchar(50),
        address              varchar(100),
        add_detail           varchar(255),
        phonenum             varchar(20),
        telnum               varchar(20),
        email                varchar(50),
        payment_method       varchar(50),
        primary key (receive_id)
        );*/
public class Receiveinfo {
    private String  receiveId;
    private String  userId;
    private String  orderId;
    private String  receiveName;
    private String  province;
    private String  city;
    private String  addDetail;
    private String  phonenum;
    private String  telnum;
    private String  email;
    private String  paymentMethod;

    public String getReceiveId() {
        return receiveId;
    }
    public void setReceiveId(String receiveId) {
        this.receiveId = receiveId;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getOrderId() {
        return orderId;
    }
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
    public String getReceiveName() {
        return receiveName;
    }
    public void setReceiveName(String receiveName) {
        this.receiveName = receiveName;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddDetail() {
        return addDetail;
    }
    public void setAddDetail(String addDetail) {
        this.addDetail = addDetail;
    }
    public String getPhonenum() {
        return phonenum;
    }
    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }
    public String getTelnum() {
        return telnum;
    }
    public void setTelnum(String telnum) {
        this.telnum = telnum;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
}
