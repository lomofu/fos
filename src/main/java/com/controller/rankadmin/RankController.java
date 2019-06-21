package com.controller.rankadmin;


import com.dto.Layui;
import com.service.RankService;
import com.util.JedisUtils;
import com.vo.ViewRank;
import io.swagger.annotations.Api;
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
@RequestMapping(value = "/rank")
@Api(value = "RankController|排行控制器")
public class RankController {
    @Autowired
    RankService rankService;
    @RequestMapping(value = "/rank20" ,method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取排名前20的电影",notes = "")
    private Layui gettop20MovieRank(HttpServletRequest request) {
        List<ViewRank> list ;
        //判断有没有20个电影
        if(getMovieRank().size()<20){
            list = getMovieRank();
        }else {
            //取list中的前20
            list = getMovieRank().subList(0, 20);
        }
        if(list.size()>0){
            return Layui.select(list.size(),list,"获取电影排行成功！");
        }else {
            return Layui.fail("获取电影失败！");
        }

    }
    @RequestMapping(value = "/rank5" ,method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取排名前5的电影",notes = "")
    private Layui gettop5MovieRank(HttpServletRequest request) {
        List<ViewRank> list ;
        //取list中的前5个
        list = getMovieRank().subList(0,5);
        if(list.size()>0){
            return Layui.select(list.size(),list,"获取电影排行成功！");
        }else {
            return Layui.fail("获取电影失败！");
        }

    }
    /*
    * 获取全部排行
    *
    * */
    private List getMovieRank(){

        Object obj;
        ArrayList list;

        //判断缓存中是否存在排行
        Boolean index=JedisUtils.isexist("rank");
        if(index){
            //获取redis中的JSON
           obj=JedisUtils.get("rank");
            //将JSON转换为List类型
            list = (ArrayList)obj;
            //查询排行

            if(list.size()>0){
                return list;
            }else {
                return null;
            }
        }else{
            list = rankService.getAllMovieRank();
            //放入排行表中
            rankService.addRank(list);
            //放入redis
            JedisUtils.set("rank",list);

            if(list.size()>0){
                return list;
            }else {
                return null;
            }
        }
    }
}
