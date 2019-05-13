package com.controller.movieadmin;


import com.dto.Layui;
import com.entity.Movie;
import com.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/movie")
public class movieontroller {
    @Autowired
    private MovieService movieService;


}
