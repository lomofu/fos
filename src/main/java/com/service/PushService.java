package com.service;

import com.entity.Push;

import java.util.ArrayList;

public interface PushService {

    ArrayList getFollowId(Integer userId);

    ArrayList getFollow(Integer userId);

    int isFollow(Integer userId,Integer followId);

    int addFollow (Push push);

    int deleteFollow(Push push);


}
