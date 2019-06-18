package com.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 评论表
 */
@Setter
@Getter
public class MovieComment implements Serializable {
    private Integer commentId;
    private String content;
    private Date createTime;
    private Float start;
    private Integer state;
    private Movie movie;
    private User user;


}
