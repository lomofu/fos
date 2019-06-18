package com.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;
/*
* 日志
* */
@Getter
@Setter
public class Log implements Serializable {
    private Integer logId;
    private String username;
    private Date createdate;
    private String content;
    private String operation;
    private String type;


}
