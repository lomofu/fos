package com.controller.movieadmin;

import com.dto.Layui;
import com.service.MovieService;
import com.util.HttpServletRequestUtil;
import com.vo.VeiwMovie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/movie")
public class movieController {
    @Autowired
    private MovieService movieService;

    @RequestMapping(value = "/movielist",method = RequestMethod.GET)
    @ResponseBody
    private Layui selectAllMovie(HttpServletRequest request) {
        ArrayList list = new ArrayList();
        list = movieService.getAllMovie();
        if (list.size() > 0) {
            return Layui.select(list.size(), list, "查询电影库成功！");
        }else {
            return Layui.fail("无数据");
        }
    }
    @RequestMapping(value = "/moviesinfo",method = RequestMethod.GET)
    @ResponseBody
    private Layui selectMovieById(HttpServletRequest request){
        Integer movieId= HttpServletRequestUtil.getInt(request,"movieid");
        VeiwMovie veiwMovie=movieService.getMovieByMovieId(movieId);
        if (veiwMovie!=null){
            return Layui.select(1,veiwMovie,"查询电影成功！");
        }else {
            return Layui.fail("没有这个电影");
        }

    }

}
