package com.service;

import com.dto.Layui;
import com.entity.Movie;
import org.springframework.stereotype.Service;
import java.util.List;

public interface MovieService {
    List<Movie>getAllMovie();
}
