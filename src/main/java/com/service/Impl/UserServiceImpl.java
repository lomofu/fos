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
    @Transactional
    public Layui addUser(User user, InputStream userImgInputStream, String fileName) {
        if (user.equals(null)) {

            throw new RuntimeException("用户不能为空");

        }

        try {
            user.setCreateTime(new Date());
            user.setState(1);
            user.setUserType(1);
            if (userImgInputStream != null) {
                try {
                    String userImg = insertUserImg(user, userImgInputStream, fileName);
                    user.setUserImg(userImg);
                } catch (Exception e) {
                    throw new RuntimeException("添加图片错误" + e.getMessage());
                }
                int effectednum = userDao.insertUser(user);
                if (effectednum <= 0) {
                    throw new RuntimeException("用户创建失败");
                }
            } else {
                Exception e = new Exception();
                throw new RuntimeException("图片不能为空" + e.getMessage());
            }
        } catch (RuntimeException e) {
            throw new RuntimeException("添加用户错误" + e.getMessage());
        }
        return Layui.addsuccess(1);
    }

    private String insertUserImg(User user, InputStream userImgInputStream, String fileName) {
        String dir = PathUtil.getUserImgPath(user.getUserId());
        String userImgAddr = ImageUtil.generateThumbnail(userImgInputStream, fileName, dir);
        return userImgAddr;
    }

}
