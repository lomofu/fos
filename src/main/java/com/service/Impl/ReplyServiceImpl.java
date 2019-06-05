package com.service.Impl;

import com.dao.ReplyDao;
import com.entity.MovieReply;
import com.service.ReplyService;
import com.vo.VeiwMovieReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
@Service
public class ReplyServiceImpl  implements ReplyService {
    @Autowired
    private ReplyDao replyDao;
    @Override
    public ArrayList<VeiwMovieReply> getRelyByUserId(Integer userId) {
        return replyDao.queryRelyByUserId(userId);
    }

    @Override
    public int addMovieReply(MovieReply movieReply) {
        return replyDao.inserMovieReply(movieReply);
    }

    @Override
    public int delectMovieReply(MovieReply movieReply) {
        return replyDao.delectMovieReply(movieReply);
    }
}
