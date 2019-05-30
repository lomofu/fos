package com.dao;

import com.BaseTest;
import com.vo.VeiwMovie;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MovieDaoTest extends BaseTest {
    @Autowired
    private MovieDao movieDao;


    @Test
    public void queryAllMovieTest(){
        List list = movieDao.queryAllMovie();
    }
}
