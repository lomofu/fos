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

<<<<<<< HEAD
    @RequestMapping(value = "/userinfo",method = RequestMethod.GET)
    private String info(){return "usercentre/modifyinfo";}

    @RequestMapping(value = "/ok")
    private  String successinfo(){return "usercentre/success";}

    @RequestMapping(value = "/goback")
    private String goback(){return "usercentre/successpassword";}
=======
    @RequestMapping(value = "/info",method = RequestMethod.GET)
    private String info(){return "usercentre/modifyinfo";}

>>>>>>> fe5d5ad41dca306d1c3d1bc1fdfb53beff451dd7
}
