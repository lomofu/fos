package com.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class ViewStars implements Serializable {
    private Integer movieId;
    private String movieName;
    private String movieImg;
    private Date createTime;

}
