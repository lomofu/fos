package com.service;

import com.dto.Layui;
import com.entity.User;

import java.io.InputStream;

public interface UserService {
    Layui addUser(User user, InputStream userImgInputStream,String fileName);
}
