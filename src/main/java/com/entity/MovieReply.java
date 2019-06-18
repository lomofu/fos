package com.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;


@Setter
@Getter
public class MovieReply implements Serializable {
    private Integer replyId;
    private Integer userId;
    private Integer commentId;
    private String rcontent;
    private Date createTime;
    private Integer state;
    private Integer parentId;
    private User user;
    private MovieComment movieComment;

}
