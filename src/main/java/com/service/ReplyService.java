package com.service;

import com.entity.MovieReply;
import com.vo.VeiwMovieReply;

import java.util.ArrayList;

public interface ReplyService {
    ArrayList<VeiwMovieReply> getRelyByUserId(Integer userId);

    int addMovieReply(MovieReply movieReply);

    int delectMovieReply(MovieReply movieReply);
}