package com.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class ViewPush implements Serializable {
    private Integer followId;
    private String userName;
    private String userImg;
    private Date createTime;


}
