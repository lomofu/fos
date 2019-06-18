package com.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
public class VeiwMovieComment implements Serializable {
    private Integer commentId;
    private String content;
    private Date createTime;
    private Float start;
    private Integer state;
    private Integer userId;
    private String userName;
    private String userImg;


}
