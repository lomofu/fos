package com.dao;

import com.entity.User;

public interface UserDao {
    //增加新用户
    int insertUser(User user);
}
