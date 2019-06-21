package com.controller.infoadmin;

import com.dto.Layui;
import com.service.InfoService;
import com.util.HttpServletRequestUtil;
import com.vo.VeiwInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
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
@RequestMapping(value = "/info")
@Api(value = "InfoController|资讯控制器")
public class infoController {
    @Autowired
    private InfoService infoService;

    @RequestMapping(value = "infolistcount")
    @ResponseBody
    @ApiOperation(value = "获取所有资讯的数量",notes = "")
    private Layui getAllInfdCount(HttpServletRequest request){
        int num=infoService.getAllInfoCount();
        if (num>0){
            return Layui.success("咨询列表总数查询成功",num);

        }else {
            return  Layui.fail("咨询列表为空");
        }
    }


    @RequestMapping(value = "infolist",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取所有资讯",notes = "")
    @ApiImplicitParam(paramType="path", name = "pagenum", value = "用户ID", required = true, dataType = "Integer")
    private Layui getAllInfo(HttpServletRequest request){
        int pageNum=HttpServletRequestUtil.getInt(request,"pagenum");
        List<VeiwInfo> list=new ArrayList<VeiwInfo>();
        list=infoService.selectAllInfo(pageNum,5);
        if (list.size()>0){
            return Layui.select(list.size(),list,"查询新闻成功!");
        }else {
            return Layui.fail("查询新闻失败！");
        }
    }

    @RequestMapping(value = "three",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取前三个资讯",notes = "")
    private Layui getOnlyThree(HttpServletRequest request){
        List<VeiwInfo> list=new ArrayList<>();
        list=infoService.selectOnlyThree();
        if (list.size()>0){
            return Layui.select(list.size(),list,"查询最新咨询成功!");
        }else {
            return Layui.fail("查询最新咨询失败！");
        }

    }

    @RequestMapping(value = "info",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "查询某一条资讯",notes = "根据资讯Id查询")
    @ApiImplicitParam(paramType="path", name = "infoid", value = "用户ID", required = true, dataType = "Integer")
    private Layui getByInfoId(HttpServletRequest request){
        Integer infoId= HttpServletRequestUtil.getInt(request,"infoid");
        VeiwInfo veiwInfo=infoService.getByInfoId(infoId);
        if (veiwInfo!=null){
            return Layui.select(1,veiwInfo,"查询一条新闻成功！");
        }else {
            return Layui.fail("查询一条新闻失败！");
        }
    }



}
