package com.controller.infoadmin;

import com.dto.Layui;
import com.service.InfoService;
import com.util.HttpServletRequestUtil;
import com.vo.VeiwInfo;
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
public class infoController {
    @Autowired
    private InfoService infoService;

    @RequestMapping(value = "infolistcount")
    @ResponseBody
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
