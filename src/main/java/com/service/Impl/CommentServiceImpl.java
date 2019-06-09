package com.service.Impl;

import com.dao.CommentDao;
import com.entity.MovieComment;
import com.service.CommentService;
import com.vo.VeiwMovieComment;
import com.vo.ViewUserComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;


    @Override
    public ArrayList<VeiwMovieComment> getAllCommentByMovieId(Integer movieId) {
        return commentDao.queryAllCommentByMovieId(movieId) ;
    }

    @Override
    public ArrayList<ViewUserComment> getAllCommentByUserId(Integer userId) {
        return commentDao.queryAllCommentByUserId(userId);
    }

    @Override
    public int addComment(MovieComment movieComment) {
        int num=commentDao.insertComment(movieComment);
        return num;
    }

    @Override
    public int updateComment(MovieComment movieComment) {
        return commentDao.updateComment(movieComment);
    }

    @Override
    public int delectComment(MovieComment movieComment) {
        return commentDao.delectComment(movieComment);
    }

    @Override
    public ArrayList<MovieComment> selectComment(MovieComment movieComment) {
        return commentDao.selectComment(movieComment);
    }
}
