package com.dao;

import com.BaseTest;
import com.entity.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

import static junit.framework.TestCase.assertEquals;

public class UserDaoTest extends BaseTest {
    @Autowired
    private UserDao userDao;

    @Test
    public void insertUserTest(){
        User user=new User();
        user.setUserName("a三");
        user.setPassword("admin");
        user.setAge(18);
        user.setEmail("zhangsan@qq.com");
        user.setPhone("11110");
        user.setSex(1);
        user.setUserImg("张三的图片");
        user.setCreateTime(new Date());
        user.setState(1);
        user.setUserType(1);

        int num=userDao.insertUser(user);
        assertEquals(1,num);


    }
}
