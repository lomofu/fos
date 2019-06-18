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
import java.util.List;

@Controller
@RequestMapping(value = "/movie")
public class movieController {
    @Autowired
    private MovieService movieService;

    @RequestMapping(value = "/count",method = RequestMethod.GET)
    @ResponseBody
    private Layui getCount(){
        int num=movieService.getMovieCount();
        if (num>0){
            return Layui.success("查询电影库总数量成功",num);
        }else {
            return Layui.fail("查询失败");
        }
    }

    @RequestMapping(value = "/typecount",method = RequestMethod.GET)
    @ResponseBody
    private Layui getTypeCount(HttpServletRequest request){
        Integer typeId=HttpServletRequestUtil.getInt(request,"typeid");
        int num=movieService.getTypeMovieCount(typeId);
        if (num>0){
            return Layui.success("查询该类型电影总数量成功",num);
        }else {
            return Layui.fail("查询失败");
        }
    }


    @RequestMapping(value = "/movielist",method = RequestMethod.GET)
    @ResponseBody
    private Layui selectAllMovie(HttpServletRequest request) {
        int pageNum = HttpServletRequestUtil.getInt(request,"pagenum");
        ArrayList list = new ArrayList();
        list = movieService.getAllMovie(pageNum,16);
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
        VeiwMovie veiwMovie2=movieService.getMovieByMovieIdInfo(movieId);

        if (veiwMovie!=null){
            return Layui.select(1,veiwMovie,"查询电影成功！");
        }else if (veiwMovie2!=null) {
            veiwMovie2.setStart(0.0f);
            return Layui.select(1,veiwMovie2,"电影信息没有带评分查询成功！");
        }else {
            return Layui.fail("没有这个电影");
        }

    }

    @RequestMapping(value = "/movietype",method = RequestMethod.GET)
    @ResponseBody
    private Layui selectMovieByTypeId(HttpServletRequest request){
        Integer typeId= HttpServletRequestUtil.getInt(request,"typeid");
        Integer pageNum = HttpServletRequestUtil.getInt(request,"pagenum");
        List<VeiwMovie> list=new ArrayList<VeiwMovie>();
        list=movieService.getMovieByTypeId(typeId,pageNum,16);
        if (list.size()>0){
            return Layui.select(1,list,"查询这个类型电影成功！");
        }else {
            return Layui.fail("这个电影类型没有相应电影");
        }
    }

    @RequestMapping(value = "/moviename",method = RequestMethod.GET)
    @ResponseBody
    private Layui selectMovieByName(HttpServletRequest request){
        Integer page=HttpServletRequestUtil.getInt(request,"pagenum");
        String movieName = HttpServletRequestUtil.getString(request,"moviename");
        List<VeiwMovie> list = new ArrayList<>();
        list = movieService.getMovieByName(movieName,page,5);
        if(list.size()>0){
            return Layui.select(1,list,"电影名称查询成功");
        }else{
            return Layui.fail("没有这个电影");
        }
    }



}
