package com.service.Impl;

import com.annotation.logAnnotation;
import com.dao.ReplyDao;
import com.entity.MovieReply;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
    public ArrayList<VeiwMovieReply> getRelyByCommentId(Integer commentId) {
        return replyDao.queryRelyByCommentId(commentId);
    }

    @Override
    @logAnnotation(operationName = "通过评论获取所有回复")
    public ArrayList<VeiwMovieReply> getRelyByCommentId(Integer commentId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        ArrayList movieReplyList= new ArrayList();
        movieReplyList=replyDao.queryRelyByCommentId(commentId);
        PageInfo page = new PageInfo(movieReplyList);
        return movieReplyList;
    }

    @Override
    public ArrayList<VeiwMovieReply> getRelyByUserId(Integer userId) {
        return replyDao.queryRelyByUserId(userId);
    }

    @Override
    @logAnnotation(operationName = "获取该用户所有回复")
    public ArrayList<VeiwMovieReply> getRelyByUserId(Integer userId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        ArrayList replyList= new ArrayList();
        replyList=replyDao.queryRelyByUserId(userId);
        PageInfo page = new PageInfo(replyList);
        return replyList;
    }

    @Override
    public int getRelyByUserIdCount(Integer userId) {
        return replyDao.queryRelyByUserIdCount(userId);
    }

    @Override
    public int getRelyByCommentIdCount(Integer commentId) {
        return replyDao.queryRelyByCommentIdCount(commentId);
    }

    @Override
    @logAnnotation(operationName = "添加回复")
    public int addMovieReply(MovieReply movieReply) {
        return replyDao.inserMovieReply(movieReply);
    }

    @Override
    public int delectMovieReply(MovieReply movieReply) {
        return replyDao.delectMovieReply(movieReply);
    }
}
