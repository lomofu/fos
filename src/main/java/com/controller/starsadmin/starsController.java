package com.controller.starsadmin;


import com.dto.Layui;
import com.entity.Stars;
import com.service.StarsService;
import com.util.HttpServletRequestUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/stars")
@Api(value = "StarsController|收藏控制器")
public class starsController {

    @Autowired
    private StarsService starsService;


    @RequestMapping(value = "/getstarsmovie",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取电影收藏列表",notes = "")
    @ApiImplicitParam(paramType="path", name = "userid", value = "用户ID", required = true, dataType = "Integer")
    private Layui getStarsMovie(HttpServletRequest request){
        Integer userId= HttpServletRequestUtil.getInt(request,"userid");
        List list=new ArrayList();
        list=starsService.getStarMovie(userId);
        if (list.size()>0){
            return Layui.select(list.size(),list,"查询电影收藏列表成功！");
        }else {
            return Layui.fail("暂无收藏");
        }
    }

    @RequestMapping(value = "/addstarmovie",method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "添加收藏",notes = "")
    @ApiImplicitParam(paramType="body", name = "stars", value = "收藏", required = true, dataType = "Stars")
    private Layui addStarMovie(@RequestBody Stars stars){
        stars.setCreateTime(new Date());
        int num=starsService.addStarMovie(stars);
        if (num>0){
            return Layui.success("收藏成功！");

        }else {
            return Layui.fail("收藏失败！");
        }
    }

    @RequestMapping(value = "/deletestarmovie",method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "删除收藏",notes = "")
    @ApiImplicitParam(paramType="body", name = "stars", value = "收藏", required = true, dataType = "Stars")
    private Layui deleteStarMovie(@RequestBody Stars stars){
        stars.setCreateTime(new Date());
        int num =starsService.deleteStarMovie(stars);
        if (num>0){
            return Layui.success("取消收藏成功！");
        }else {
            return Layui.fail("取消收藏失败！");
        }
    }


    @RequestMapping(value = "/isstar",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "判断该用户有无收藏此电影",notes = "")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType="query", name = "userId", value = "用户id", required = true, dataType = "Integer"),
            @ApiImplicitParam(paramType="query", name = "movieId", value = "电影id", required = true, dataType = "Integer")
    })
    private Layui isStar(@RequestParam Integer userId,@RequestParam Integer movieId){
        int num=starsService.isStar(userId,movieId);
        if (num>0){
            return Layui.success("此用户收藏了这部电影");
        }else {
            return Layui.fail("此用户没有收藏这部电影");
        }
    }

}
