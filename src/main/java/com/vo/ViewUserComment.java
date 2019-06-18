package com.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
public class ViewUserComment  implements Serializable {
    private Integer commentId;
    private String content;
    private Date createTime;
    private Integer start;
    private Integer state;
    private Integer movieId;
    private String movieName;
    private String movieImg;
    private Integer userId;
    private String userName;
    private String userImg;

}
