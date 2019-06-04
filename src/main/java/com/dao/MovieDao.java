package com.dao;


import com.vo.VeiwMovie;

import java.util.ArrayList;

public interface MovieDao {

    ArrayList<VeiwMovie> queryAllMovie();

    ArrayList<VeiwMovie> queryMovieByType(Integer typeId);

    VeiwMovie queryByMovieId(Integer movieId);

    VeiwMovie queryByMovieIdInfo(Integer movieId);


}
