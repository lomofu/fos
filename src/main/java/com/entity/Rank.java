package com.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 排名
 */
@Setter
@Getter
public class Rank implements Serializable {
    private Integer rankId;
    private Integer movieId;
    private Integer avgStart;
    private Integer count;
    private Date createTime;

}
