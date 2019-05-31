package com.dao;

import java.util.ArrayList;

public interface CommentDao {
    ArrayList queryAllCommentByMovieId(Integer movieId);

    ArrayList queryAllCommentByUserId(Integer userId);
}
