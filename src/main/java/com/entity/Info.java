package com.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 咨询
 */

@Setter
@Getter
public class Info implements Serializable {
    private Integer infoId;
    private Date createTime;
    private String title;
    private String infoContent;
    private String infoImg;
    private Integer adminId;
    private String infoFrom;

}
