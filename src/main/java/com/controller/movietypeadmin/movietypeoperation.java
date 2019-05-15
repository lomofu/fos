package com.controller.movietypeadmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/movietype")
public class movietypeoperation {

    @RequestMapping(value = "/nav")
    private String nav(){
        return "nav/nav";
    }

    @RequestMapping(value = "/movielist")
    private String movieList(){return "nav/movie_list";}

    @RequestMapping(value = "/movie")
    private String movie(){return "nav/movie";}

    @RequestMapping(value = "/news")
    private String news(){return "nav/news";}

    @RequestMapping(value = "/newssingle")
    private String newsSingle(){return "nav/news_single";}

    @RequestMapping(value = "/type")
    private String type(){return "nav/type";}

}
