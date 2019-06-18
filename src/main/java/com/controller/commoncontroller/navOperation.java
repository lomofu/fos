package com.controller.commoncontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class navOperation {
    @RequestMapping(value = "/nav")
    private String nav(){
        return "nav/nav";
    }

    @RequestMapping(value = "/load")
    private String loading(){
        return "loading/loading";
    }

    @RequestMapping(value = "/bottom")
    private String bottom(){
        return "nav/bottom";
    }


    @RequestMapping(value = "/nologin")
    private String nologin(){return "error/nologin";}

    @RequestMapping(value = "/game")
    private String some(){return "error/game";}

    @RequestMapping(value = "/search")
    private String search(){return "search/resultlist";}


}
