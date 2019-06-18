package com.dao;

import com.entity.Push;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface PushDao {
    ArrayList queryFollowId(Integer userId);

    ArrayList queryFollow(Integer userId);

    int queryIsHave(@Param("userId")Integer userId,@Param("followId")Integer followId);

    int queryIsFollow(@Param("userId")Integer userId,@Param("followId")Integer followId);

    int insertUser(Push push);

    int deleteUser(Push push);

    int updateUser(Push push);
}
