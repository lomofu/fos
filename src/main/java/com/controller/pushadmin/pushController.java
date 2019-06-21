package com.controller.pushadmin;

import com.dto.Layui;
import com.entity.Push;
import com.service.PushService;
import com.util.HttpServletRequestUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/push")
@Api(value = "PushController|关注控制器")
public class pushController {
    @Autowired
    private PushService pushService;

    @RequestMapping(value = "/followid")
    @ResponseBody
    @ApiOperation(value = "进行推送",notes = "通过userid获取followid")
    @ApiImplicitParam(paramType="path", name = "userid", value = "用户ID", required = true, dataType = "Integer")
    private Layui getFollowId(HttpServletRequest request) {
        Integer userId = HttpServletRequestUtil.getInt(request, "userid");
        List list = new ArrayList();
        list = pushService.getFollowId(userId);
        if (list.size() > 0) {
            return Layui.select(list.size(), list, "查询关注用户列表成功！");
        } else {
            return Layui.fail("无关注用户！");
        }
    }

    @RequestMapping(value = "/follow")
    @ResponseBody
    @ApiOperation(value = "获取用户的关注列表",notes = "通过userid获取关注用户信息")
    @ApiImplicitParam(paramType="path", name = "userid", value = "用户ID", required = true, dataType = "Integer")
    private Layui getFollow(HttpServletRequest request) {
        Integer userId = HttpServletRequestUtil.getInt(request, "userid");
        List list = new ArrayList();
        list = pushService.getFollow(userId);
        if (list.size() > 0) {
            return Layui.select(list.size(), list, "查询关注用户列表成功！");
        } else {
            return Layui.fail("无关注用户！");
        }
    }


    @RequestMapping(value = "/isfollow")
    @ResponseBody
    @ApiOperation(value = "关注判断",notes = "通过userid和followid查询后判断该用户是否已经被关注")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType="path", name = "userid", value = "用户ID", required = true, dataType = "Integer"),
            @ApiImplicitParam(paramType="path", name = "followid", value = "用户ID", required = true, dataType = "Integer")
    })
    private Layui isFollow(HttpServletRequest request) {
        Integer userId = HttpServletRequestUtil.getInt(request, "userid");
        Integer followId = HttpServletRequestUtil.getInt(request, "followid");
        int num = pushService.isFollow(userId, followId);
        if (num > 0) {
            return Layui.success("当前用户已经被关注");
        } else {
            return Layui.fail("还没有关注");
        }
    }


    @RequestMapping(value = "/addfollow", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "添加关注",notes = "")
    @ApiImplicitParam(paramType="body", name = "push", value = "关注", required = true, dataType = "Push")
    private Layui addFollow(@RequestBody Push push) {
        push.setCreateTime(new Date());
        int num = pushService.addFollow(push);
        if (num > 0) {
            return Layui.success("关注成功！");
        } else {
            return Layui.fail("关注失败！");
        }

    }

    @RequestMapping(value = "/deletefollow", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "取消关注",notes = "")
    @ApiImplicitParam(paramType="body", name = "push", value = "关注", required = true, dataType = "Push")
    private Layui deleteFollow(@RequestBody Push push) {
        int num = pushService.deleteFollow(push);
        if (num > 0) {
            return Layui.success("取消关注！");
        } else {
            return Layui.fail("取消关注失败");
        }
    }
}
