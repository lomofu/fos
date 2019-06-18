package com.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户
 */
@Setter
@Getter
public class User  implements Serializable {
    private Integer userId;
    private String userName;
    private String password;
    private Integer sex;
    private Integer age;
    private String userImg;
    private String email;
    private String phone;
    private Date createTime;
    //0 未登录 1登陆
    private Integer state;
    // -1 注销 0普通用户 1超级管理员
    private Integer userType;


}