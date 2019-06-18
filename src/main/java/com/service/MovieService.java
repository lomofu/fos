package com.service;

import com.vo.VeiwMovie;

import java.util.ArrayList;

public interface MovieService {

    int getMovieCount();

    int getTypeMovieCount(Integer typeId);

    VeiwMovie getMovieByMovieId(Integer movieId);

    VeiwMovie getMovieByMovieIdInfo(Integer movieId);

    ArrayList<VeiwMovie> getAllMovie(int pageNum,int pageSize);

    ArrayList<VeiwMovie> getMovieByTypeId(Integer typeId);

    ArrayList<VeiwMovie> getMovieByTypeId(Integer typeId,int pageNum,int pageSize);

    ArrayList<VeiwMovie> getMovieByName(String movieName);

    ArrayList<VeiwMovie> getMovieByName(String movieName,int pageNum,int pageSize);
}
