package com.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
public class Push implements Serializable {
    private Integer userId;
    private Integer followId;
    private Integer state;
    private Date createTime;

}
