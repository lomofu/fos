package com.controller.movieadmin;

import org.springframework.web.bind.annotation.RequestMapping;

public class movieOperation {
    @RequestMapping(value = "/movielist")
    private String movieList(){return "movie_list.jsp";}
}
