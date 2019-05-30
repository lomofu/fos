package com.controller.movieadmin;


import com.dto.Layui;
import com.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/movie")
public class movieController {
    @Autowired
    private MovieService movieService;

    @RequestMapping(value = "/movielist",method = RequestMethod.GET)
    @ResponseBody
    private Layui selectAllMovie(HttpServletRequest request){
    ArrayList list=new ArrayList();
    list=movieService.getAllMovie();
    return Layui.select(list.size(),list,"查询成功");
    }

}
