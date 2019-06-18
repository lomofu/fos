package com.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 电影实体类
 */
@Setter
@Getter
public class Movie implements Serializable {

    private Integer movieId;
    private String movieName;
    private Integer typeId;
    private Date onTime;
    private String language;
    private String country;
    private String movieTime;
    private String director;
    private String actor;
    private String movieImg;
    private String movieVideo;
    private String profile;

}
