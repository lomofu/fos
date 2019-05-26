package com.service.Impl;

import com.dao.UserDao;
import com.dto.Layui;
import com.entity.User;
import com.service.UserService;
import com.util.ImageUtil;
import com.util.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;
import java.util.Date;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User login(User user) {
        return userDao.selectUser(user);
    }


    @Override
    @Transactional
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


    private String insertUserImg(User user, InputStream userImgInputStream, String fileName) {
        String dir = PathUtil.getUserImgPath(user.getUserId());
        String userImgAddr = ImageUtil.generateThumbnail(userImgInputStream, fileName, dir);
        return userImgAddr;
    }

    @Override
    @Transactional
    public int updateUserInfo(User user) {
        try {
            if (user.equals(null)) {
                throw new RuntimeException("用户不能为空");
            }

<<<<<<< HEAD
            int effectNum = userDao.updateUser(user);
            if (effectNum <= 0) {
                System.out.println("====================");
=======
            int effectNum = userDao.insertUser(user);
            if (effectNum <= 0) {
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
                throw new RuntimeException("更新信息失败");
            } else {
                return effectNum;
            }
        } catch (RuntimeException e) {
            throw new RuntimeException("更新信息失败" + e.getMessage());
        }

    }

    @Override
<<<<<<< HEAD

=======
    @Transactional
>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
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
