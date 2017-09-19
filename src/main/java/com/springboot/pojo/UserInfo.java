package com.springboot.pojo;

/**
 * Created by WEN on 2017/9/13.
 */

import java.util.Date;

/*create table USER_INFO
        (
        user_info_id         varchar(40) not null,
        realname             varchar(20),
        card_no              varchar(20),
        join_date            timestamp,
        gender               char(2),
        birthday             timestamp,
        statment             varchar(20),
        activecode           varchar(32),
        user_level           int(8),
        remark               varchar(600),
        primary key (user_info_id)
        );*/
public class UserInfo {
    private static final long serialVersionUID = -5651134964328474820L;

    private String userInfoId;
    private String name;
    private String cardNo;
    private Date joinDate;
    private String gender;
    private Date birthday;
    private String statment;
    private String activecode;
    private Integer userLevel;
    private String remark;

    public String getUserInfoId() {

        return userInfoId;
    }
    public void setUserInfoId(String userInfoId) {

        this.userInfoId = userInfoId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCardNo() {

        return cardNo;
    }
    public void setCardNo(String cardNo) {

        this.cardNo = cardNo;
    }
    public Date getJoinDate() {

        return joinDate;
    }
    public void setJoinDate(Date joinDate) {

        this.joinDate = joinDate;
    }
    public String getGender() {

        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public Date getBirthday() {

        return birthday;
    }
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    public String getStatment() {

        return statment;
    }
    public void setStatment(String statment) {

        this.statment = statment;
    }
    public String getActivecode() {
        return activecode;
    }
    public void setActivecode(String activecode) {
        this.activecode = activecode;
    }
    public Integer getUserLevel() {
        return userLevel;
    }
    public void setUserLevel(Integer userLevel) {
        this.userLevel = userLevel;
    }
    public String getRemark() {
        return remark;
    }
    public void setRemark(String remark) {
        this.remark = remark;
    }

}



