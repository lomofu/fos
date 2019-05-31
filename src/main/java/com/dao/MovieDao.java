package com.dao;


import com.vo.VeiwMovie;

import java.util.ArrayList;

public interface MovieDao {
    ArrayList<VeiwMovie> queryAllMovie();

    VeiwMovie queryByMovieId(Integer movieId);

}
