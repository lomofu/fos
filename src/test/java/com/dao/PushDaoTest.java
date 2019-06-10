package com.dao;

import com.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class PushDaoTest extends BaseTest {
    @Autowired
    private PushDao pushDao;

    @Test
    public void queryFollowId(){
        List list=new ArrayList();
        list=pushDao.queryFollowId(1005);
        System.out.println(list.size());
        System.out.println(list.get(0).toString());

    }
}
