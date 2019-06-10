package com.controller.pushadmin;

import com.dto.Layui;
import com.service.PushService;
import com.util.HttpServletRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/push")
public class pushController {
    @Autowired
    private PushService pushService;

    @RequestMapping(value = "/followid")
    @ResponseBody
    private Layui getFollowId(HttpServletRequest request){
        Integer userId= HttpServletRequestUtil.getInt(request,"userid");
        List list=new ArrayList();
        list=pushService.getFollowId(userId);
        if (list.size()>0){
            return Layui.select(list.size(),list,"查询关注用户列表成功！");
        }else {
            return Layui.fail("查询失败");
        }


    }
}
