package com.service;

import com.entity.MovieReply;
import com.vo.VeiwMovieReply;

import java.util.ArrayList;

public interface ReplyService {

    ArrayList<VeiwMovieReply>getRelyByCommentId(Integer commentId);

    ArrayList<VeiwMovieReply> getRelyByCommentId(Integer commentId,int pageNum,int pageSize);

    ArrayList<VeiwMovieReply> getRelyByUserId(Integer userId);

    ArrayList<VeiwMovieReply> getRelyByUserId(Integer userId,int pageNum,int pageSize);

    int getRelyByUserIdCount(Integer userId);

    int getRelyByCommentIdCount(Integer commentId);

    int addMovieReply(MovieReply movieReply);

    int delectMovieReply(MovieReply movieReply);
}