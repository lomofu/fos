package com.controller.useradmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class userOperation {
    @RequestMapping(value = "/success")
    private String success(){return "register/success";}

    @RequestMapping(value = "/centre",method = RequestMethod.GET)
    private String centre(){return "usercentre/centre";}

    @RequestMapping(value = "/userinfo",method = RequestMethod.GET)
    private String info(){return "usercentre/modifyinfo";}

}
