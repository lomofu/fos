package com.dao;

import com.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.ArrayList;
import java.util.List;

public class ReplyDaoTest extends BaseTest {
    @Autowired
    private ReplyDao replyDao;

    @Test
    public void queryRelyByUserId(){
        List list=new ArrayList();
        list=replyDao.queryRelyByUserId(1004);

    }
    @Test
    public void queryRelyByCommentId(){
        List list=new ArrayList();
        list=replyDao.queryRelyByCommentId(3003);
    }
}
