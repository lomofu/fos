package com.dao;

import com.entity.MovieComment;

import java.util.ArrayList;

public interface CommentDao {
    ArrayList queryAllCommentByMovieId(Integer movieId);

    ArrayList queryAllCommentByUserId(Integer userId);

    int insertComment(MovieComment movieComment);
}
