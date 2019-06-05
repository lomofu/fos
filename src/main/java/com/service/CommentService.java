package com.service;

import com.entity.MovieComment;
import com.vo.VeiwMovieComment;
import com.vo.ViewUserComment;

import java.util.ArrayList;

public interface CommentService {
    ArrayList<VeiwMovieComment>getAllCommentByMovieId(Integer movieId);

    ArrayList<ViewUserComment>getAllCommentByUserId(Integer userId);

    int addComment(MovieComment movieComment);

    int updateComment(MovieComment movieComment);

    int delectComment(MovieComment movieComment);
}
