package com.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;
@Setter
@Getter
public class VeiwMovie implements Serializable {
    private Integer movieId;
    private String movieName;
    private String typeName;
    private Date onTime;
    private String language;
    private String country;
    private String movieTime;
    private String director;
    private String actor;
    private String movieImg;
    private String movieVideo;
    private Float start;
    private String profile;


}
