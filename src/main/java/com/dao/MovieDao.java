package com.dao;

import com.entity.Movie;

import java.util.List;

public interface MovieDao {
    List<Movie> queryAllMovie();
}
