package com.service;

import com.vo.VeiwMovie;

import java.util.ArrayList;

public interface MovieService {
    ArrayList<VeiwMovie> getAllMovie();

    VeiwMovie getMovieByMovieId(Integer movieId);
}
