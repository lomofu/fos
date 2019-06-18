package com.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
public class VeiwMovieReply implements Serializable {
    private Integer replyId;
    private Integer commentId;
    private String content;
    private String rcontent;
    private Date createTime;
    private Integer state;
    private Integer userId;
    private Integer parentId;
    private String userImg;
    private String userName;


}
