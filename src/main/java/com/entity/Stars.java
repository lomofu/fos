package com.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
public class Stars implements Serializable {
    private Integer userId;
    private Integer movieId;
    private Integer state;
    private Date createTime;


}
