package com.dao;

import com.entity.MovieComment;


import java.util.ArrayList;

public interface CommentDao {
    ArrayList queryAllCommentByMovieId(Integer movieId);

    ArrayList queryAllCommentByUserId(Integer userId);

    int insertComment(MovieComment movieComment);

    int updateComment(MovieComment movieComment);

    int delectComment(MovieComment movieComment);

    ArrayList selectComment(MovieComment movieComment);
}
