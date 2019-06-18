package com.dao;

import com.entity.Stars;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface StarsDao {
    ArrayList queryStarMovie(Integer userId);

    int insertStar(Stars stars);

    int updateStar(Stars stars);

    int deleteStar(Stars stars);

    int queryIsHave(@Param("userId") Integer userId, @Param("movieId") Integer movieId);

    int queryIsStar(@Param("userId") Integer userId, @Param("movieId") Integer movieId);
}
