package com.service.Impl;

import com.dao.PushDao;
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
}
