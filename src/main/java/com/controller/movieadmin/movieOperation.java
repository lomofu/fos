package com.controller.movieadmin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class movieOperation {

    @RequestMapping(value = "/moiveinfo" ,method = RequestMethod.GET)
    private String movieInfo(){return "movie/movieinfo";}

}
