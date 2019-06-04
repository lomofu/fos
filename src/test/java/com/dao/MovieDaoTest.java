package com.dao;

import com.BaseTest;
import com.vo.VeiwMovie;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class MovieDaoTest extends BaseTest {
    @Autowired
    private MovieDao movieDao;


    @Test
    public void queryAllMovieTest(){
        List<VeiwMovie> list =new ArrayList<VeiwMovie>();
        list=movieDao.queryAllMovie();
       System.out.println(list.size());
        VeiwMovie veiwMovie=list.get(0);
       System.out.println(veiwMovie.getMovieId());
       System.out.println(veiwMovie.getMovieName());
    }

    @Test
    public void queryByMovieIdTest(){
      VeiwMovie veiwMovie=movieDao.queryByMovieId(2007);
        System.out.println(veiwMovie.getMovieId());
        System.out.println(veiwMovie.getMovieName());
    }

    @Test
    public void queryByMovieTypeTest(){
        List<VeiwMovie> list =new ArrayList<VeiwMovie>();
        list=movieDao.queryMovieByType(1104);

    }

}
