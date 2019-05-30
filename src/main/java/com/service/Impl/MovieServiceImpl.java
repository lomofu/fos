package com.service.Impl;

import com.dao.MovieDao;
import com.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


@Service
public class MovieServiceImpl implements MovieService {
    @Autowired
    private MovieDao movieDao;

    @Override
    public ArrayList getAllMovie() {
        ArrayList movieList= new ArrayList();
        movieList=movieDao.queryAllMovie();
        return movieList;
    }
}
