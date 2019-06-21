package com.controller.movieadmin;

import com.dto.Layui;
import com.service.MovieService;
import com.util.HttpServletRequestUtil;
import com.vo.VeiwMovie;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
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
@Api(value = "MovieController|电影信息控制器")
public class movieController {
    @Autowired
    private MovieService movieService;

    @RequestMapping(value = "/count",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取电影总数",notes = "")
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
    @ApiOperation(value = "获取该类型电影的总数",notes = "通过typeid查询电影")
    @ApiImplicitParam(paramType="path", name = "typeid", value = "电影类型ID", required = true, dataType = "Integer")
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
    @ApiOperation(value = "获取所有电影",notes = "进行过分页")
    @ApiImplicitParam(paramType="path", name = "pagenum", value = "分页数", required = true, dataType = "Integer")
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
    @ApiOperation(value = "查询一条电影",notes = "")
    @ApiImplicitParam(paramType="path", name = "movieid", value = "电影ID", required = true, dataType = "Integer")
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
    @ApiOperation(value = "查询该电影类型下的所有电影",notes = "")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType="path", name = "typeid", value = "电影类型ID", required = true, dataType = "Integer"),
            @ApiImplicitParam(paramType="path", name = "pagenum", value = "分页数", required = true, dataType = "Integer")
    })
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
    @ApiOperation(value = "通过电影名查询电影",notes = "")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType="path", name = "pagenum", value = "分页数", required = true, dataType = "Integer"),
            @ApiImplicitParam(paramType="path", name = "moviename", value = "电影名", required = true, dataType = "String")
    })
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
