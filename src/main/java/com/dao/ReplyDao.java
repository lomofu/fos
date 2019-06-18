package com.dao;

import com.entity.MovieReply;
import com.vo.VeiwMovieReply;

import java.util.ArrayList;

public interface ReplyDao {

    ArrayList<VeiwMovieReply> queryRelyByCommentId(Integer commentId);

    ArrayList<VeiwMovieReply> queryRelyByUserId(Integer userId);

    int queryRelyByCommentIdCount(Integer commentId);

    int queryRelyByUserIdCount(Integer userId);

    int inserMovieReply(MovieReply movieReply);

    int delectMovieReply(MovieReply movieReply);
}
