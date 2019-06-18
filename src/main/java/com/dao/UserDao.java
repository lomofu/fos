package com.dao;

import com.entity.User;

public interface UserDao {
    User selectUser(User user);

    User selectUserById(Integer userId);
    //增加新用户
    int insertUser(User user);
    //更新用户信息
    int updateUser(User user);
}
