package com.service.Impl;

import com.annotation.logAnnotation;
import com.dao.PushDao;
import com.entity.Push;
import com.service.PushService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class PushServiceImpl implements PushService {

    @Autowired
    private PushDao pushDao;

    @Override
    public ArrayList getFollowId(Integer userId) {
        return pushDao.queryFollowId(userId);
    }

    @Override
    public ArrayList getFollow(Integer userId) {
        return pushDao.queryFollow(userId);
    }

    @Override
    public int isFollow(Integer userId, Integer followId) {
        return pushDao.queryIsFollow(userId,followId);
    }

    @Override
    @logAnnotation(operationName = "添加推送")
    public int addFollow(Push push) {
        int num=pushDao.queryIsHave(push.getUserId(),push.getFollowId());
        if (num>0){
            return pushDao.updateUser(push);
        }else {
            return pushDao.insertUser(push);
        }
    }

    @Override
    @logAnnotation(operationName = "删除推送")
    public int deleteFollow(Push push) {
        return pushDao.deleteUser(push);
    }
}
