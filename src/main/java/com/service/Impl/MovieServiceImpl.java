package com.service.Impl;

import com.dao.MovieDao;
import com.entity.Movie;
import com.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class MovieServiceImpl implements MovieService {
    @Autowired
    private MovieDao movieDao;

    @Override
    public List<Movie> getAllMovie() {
        return movieDao.queryAllMovie();
    }
}
