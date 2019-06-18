package com.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
public class VeiwInfo implements Serializable {

    private Integer infoId;
    private Date createTime;
    private String title;
    private String infoContent;
    private Integer adminId;
    private String adminName;
    private String infoFrom;
    private String infoImg;


}
