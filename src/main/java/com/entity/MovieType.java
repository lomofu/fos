package com.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * 电影类型
 */
@Setter
@Getter
public class MovieType implements Serializable {
    private Integer typeId;
    private String typeName;

}
