package com.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class ViewRank implements Serializable {
    private Integer movieId;
    private Integer avgStart;
    private Integer count;
    private Date onTime;
    private String movieName;
    private String movieImg;


}
