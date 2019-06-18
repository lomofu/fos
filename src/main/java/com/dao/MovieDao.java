package com.dao;


import com.vo.VeiwMovie;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface MovieDao {

    int queryAllMovies();

    int queryTypeMovies(Integer typeId);

    ArrayList<VeiwMovie> queryAllMovie();

    ArrayList<VeiwMovie> queryMovieByType(Integer typeId);

    VeiwMovie queryByMovieId(Integer movieId);

    VeiwMovie queryByMovieIdInfo(Integer movieId);

    ArrayList<VeiwMovie> queryByMoieName(@Param("movieName") String movieName);

}
