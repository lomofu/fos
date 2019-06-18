package com.service;

import com.dto.Layui;
import com.entity.User;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;

public interface UserService {
    User selectByUserId(Integer userId);

    User find(User user);

    Layui login(User user, HttpServletRequest request);

    int updateUserInfo(User user);

    int addUser(User user, InputStream userImgInputStream,String fileName);

    int updateUserImg(User user,InputStream userImgInputStream,String fileName);
}
