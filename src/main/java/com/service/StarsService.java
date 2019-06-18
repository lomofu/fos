package com.service;

import com.entity.Stars;

import java.util.ArrayList;

public interface StarsService {
    ArrayList getStarMovie(Integer userId);

    int addStarMovie(Stars stars);

    int deleteStarMovie(Stars stars);

    int isStar(Integer userId,Integer movieId);
}
