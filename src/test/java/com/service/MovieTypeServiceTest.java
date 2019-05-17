package com.service;

import com.BaseTest;
import com.dao.MovieTypeDao;
import com.entity.MovieType;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class MovieTypeServiceTest extends BaseTest {
    @Autowired
    private MovieTypeService movieTypeService;
    @Test
    public void getAllMovieTypeTest(){

        List<MovieType> movieTypeList=movieTypeService.getAllMovieType();
//        assertEquals("爱情",movieTypeList.get(1).getTypeName());
    }
}
