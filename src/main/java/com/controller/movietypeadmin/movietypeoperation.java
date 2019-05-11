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

}
