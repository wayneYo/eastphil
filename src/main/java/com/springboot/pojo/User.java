package com.springboot.pojo;

/*create table USER
        (
        user_id              varchar(40) not null,
        username             varchar(50),
        password             varchar(20),
        nicakname            varchar(50),
        phonenumber          varchar(20),
        email                varchar(50),
        primary key (user_id)
        );*/

public class User {
    private static final long serialVersionUID = 2684682275136890231L;

    private UserInfo userInfo;//封装用户扩展信息

    private String userId;
    private String username;
    private String password;
    private String nickname;
    private String email;
    private String phonenumber;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }
}
