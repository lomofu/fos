package com.service.Impl;

import com.annotation.logAnnotation;
import com.dao.StarsDao;
import com.entity.Stars;
import com.service.StarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class StarsServiceImpl implements StarsService {

    @Autowired
    private StarsDao starsDao;

    @Override
    public ArrayList getStarMovie(Integer userId) {
        return starsDao.queryStarMovie(userId);
    }

    @Override
    @logAnnotation(operationName = "添加收藏")
    public int addStarMovie(Stars stars) {
        int num=starsDao.queryIsHave(stars.getUserId(),stars.getMovieId());
        if (num>0){
            return starsDao.updateStar(stars);
        }else {
            return starsDao.insertStar(stars);
        }

    }

    @Override
    @logAnnotation(operationName = "删除收藏")
    public int deleteStarMovie(Stars stars) {
        return starsDao.deleteStar(stars);
    }

    @Override
    public int isStar(Integer userId, Integer movieId) {
       return starsDao.queryIsStar(userId,movieId);
    }
}
