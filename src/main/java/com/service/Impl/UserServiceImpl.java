package com.service.Impl;

import com.annotation.logAnnotation;
import com.dao.UserDao;
import com.dto.Layui;
import com.entity.User;
import com.service.UserService;
import com.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.Date;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;



    @Override
    public User find(User user) {
        return userDao.selectUser(user);
    }



    @Override
    @logAnnotation(operationName = "登录")
    public Layui login(User user,HttpServletRequest request) {
        User result = new User();
        //前端传回来的用户名和密码
        String username = user.getUserName();
        String password = SpringMD5.passwordMD5(user.getPassword());

        if (username.matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")) {
            user.setEmail(username);
            result = userDao.selectUser(user);

        } else if (username.matches("^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$")) {
            user.setPhone(username);
            result = userDao.selectUser(user);
        } else {
            user.setUserName(username);
            result = userDao.selectUser(user);
        }

        if (result != null) {
            if (result.getPassword().equals(password)) {
                //根据id创建token
                String token = null;
                try {
                    token = JWTUtils.createToken(String.valueOf(result.getUserId()));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                //放入缓存
                JedisUtils.setToken(String.valueOf(result.getUserId()), token, 7);
                //将用户结果放入session
                request.getSession().setAttribute("user", result);
                return Layui.select(1, result, "登录成功！", token);
            } else {
                return Layui.fail("密码错误！");
            }

        } else {
            return Layui.fail("用户不存在！");

        }

    }


    @Override
    @Transactional
    @logAnnotation(operationName = "添加用户")
    public int addUser(User user, InputStream userImgInputStream, String fileName) {
        if (user.equals(null)) {
            throw new RuntimeException("用户不能为空");
        }
        try {
            user.setCreateTime(new Date());
            user.setState(1);
            user.setUserType(1);
            int effectedNum = userDao.insertUser(user);
            if (effectedNum <= 0) {
                throw new RuntimeException("用户创建失败");
            }
            if (userImgInputStream != null) {
                try {
                    String userImg = insertUserImg(user, userImgInputStream, fileName);
                    user.setUserImg(userImg);
                    int updateNum = userDao.updateUser(user);
                    return updateNum;
                } catch (Exception e) {
                    throw new RuntimeException("添加图片错误" + e.getMessage());
                }
            } else {
                Exception e = new Exception();
                throw new RuntimeException("图片不能为空" + e.getMessage());
            }
        } catch (RuntimeException e) {
            throw new RuntimeException("添加用户错误" + e.getMessage());
        }

    }

    @Override
    public User selectByUserId(Integer userId) {
        return userDao.selectUserById(userId);
    }




    private String insertUserImg(User user, InputStream userImgInputStream, String fileName) {
        String dir = PathUtil.getUserImgPath(user.getUserId());
        String userImgAddr = ImageUtil.generateThumbnail(userImgInputStream, fileName, dir);
        return userImgAddr;
    }

    @Override
    @Transactional
    @logAnnotation(operationName = "更新用户信息")
    public int updateUserInfo(User user) {
        try {
            if (user.equals(null)) {
                throw new RuntimeException("用户不能为空");
            }

            int effectNum = userDao.updateUser(user);
            if (effectNum <= 0) {
                System.out.println("====================");
                throw new RuntimeException("更新信息失败");
            } else {
                return effectNum;
            }
        } catch (RuntimeException e) {
            throw new RuntimeException("更新信息失败" + e.getMessage());
        }

    }

    @Override

    public int updateUserImg(User user, InputStream userImgInputStream, String fileName) {
        if (userImgInputStream == null) {
            throw new RuntimeException("图片获取失败！");
        }
            String userImg = insertUserImg(user, userImgInputStream, fileName);
            user.setUserImg(userImg);
            try {
                int uNum = userDao.updateUser(user);
                return uNum;
            } catch (Exception e) {
                throw new RuntimeException("添加图片错误" + e.getMessage());
            }
        }

    }
