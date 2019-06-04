package com.service.Impl;

import com.dao.MovieDao;
import com.service.MovieService;
import com.vo.VeiwMovie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


@Service
public class MovieServiceImpl implements MovieService {
    @Autowired
    private MovieDao movieDao;

    @Override
    public ArrayList<VeiwMovie> getAllMovie() {
        ArrayList movieList= new ArrayList();
        movieList=movieDao.queryAllMovie();
        return movieList;
    }

    @Override
    public VeiwMovie getMovieByMovieId(Integer movieId) {
        return movieDao.queryByMovieId(movieId);
    }

    @Override
    public VeiwMovie getMovieByMovieIdInfo(Integer movieId) {
        return movieDao.queryByMovieIdInfo(movieId);
    }

    @Override
    public ArrayList<VeiwMovie> getMovieByTypeId(Integer typeId) {
        return movieDao.queryMovieByType(typeId);
    }


}
