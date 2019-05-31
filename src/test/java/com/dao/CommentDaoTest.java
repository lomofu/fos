package com.dao;

import com.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class CommentDaoTest extends BaseTest {
    @Autowired
    private CommentDao commentDao;

    @Test
    public void queryAllCommentByMovieId(){
        List list=new ArrayList();
        list=commentDao.queryAllCommentByMovieId(2003);

    }

    @Test
    public void queryAllCommentByUserId(){
        List list=new ArrayList();
        list=commentDao.queryAllCommentByUserId(1002);

    }

}
