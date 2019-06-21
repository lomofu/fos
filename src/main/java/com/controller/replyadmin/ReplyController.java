package com.controller.replyadmin;

import com.dto.Layui;
import com.entity.MovieReply;
import com.service.ReplyService;
import com.util.HttpServletRequestUtil;
import com.vo.VeiwMovieReply;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/reply")
@Api(value = "ReplyController|回复控制器")
public class ReplyController {
    @Autowired
    private ReplyService replyService;

    /**
     * 查询
     */
    @RequestMapping(value = "/replybyuseridcount")
    @ResponseBody
    @ApiOperation(value = "获取该用户回复总数",notes = "")
    @ApiImplicitParam(paramType="path", name = "userid", value = "用户ID", required = true, dataType = "Integer")
    private Layui getReplyByUserIdCount(HttpServletRequest request){
        Integer userId=HttpServletRequestUtil.getInt(request,"userid");
        int num=replyService.getRelyByUserIdCount(userId);
        if (num>0){
            return Layui.success("查询该用户回复总数成功",num);
        }else {
            return Layui.fail("该用户收到的回复数为0");
        }
    }

    /**
     * 查询一个用户下的所有回复
     *
     * @param request
     * @return json
     */
    @RequestMapping(value = "/replybyuserid")
    @ResponseBody
    @ApiOperation(value = "获取该用户下的所有回复",notes = "进行分页")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType="path", name = "userid", value = "用户ID", required = true, dataType = "Integer"),
            @ApiImplicitParam(paramType="path", name = "pagenum", value = "用户ID", required = true, dataType = "Integer")
    })
    private Layui getReplyByUserId(HttpServletRequest request) {
        Integer userId = HttpServletRequestUtil.getInt(request, "userid");
        List<VeiwMovieReply> list = new ArrayList<VeiwMovieReply>();
        Integer pageNum = HttpServletRequestUtil.getInt(request,"pagenum");
        list = replyService.getRelyByUserId(userId,pageNum,5);
        if (list.size() > 0) {
            return Layui.select(list.size(), list, "用户回复查询成功！");
        } else {
            return Layui.fail("当前用户没有回复！");
        }
    }

    /**
     * 查询一条影评下的回复总数
     */
    @RequestMapping(value = "/replybycommentidcount")
    @ResponseBody
    @ApiOperation(value = "获取一条影评下的所有回复的总数",notes = "")
    @ApiImplicitParam(paramType="path", name = "commentid", value = "用户ID", required = true, dataType = "Integer")
    private Layui getReplyByCommentIdCount(HttpServletRequest request){
        Integer commentId=HttpServletRequestUtil.getInt(request,"commentid");
        int num=replyService.getRelyByCommentIdCount(commentId);
        if (num>0){
            return Layui.success("该影评的所有回复数查询成功",num);
        }else {
            return Layui.fail("该影评没有回复");
        }
    }

    /**
     * 查询一条影评下的所有回复
     * @param request
     * @return json
     */
    @RequestMapping(value = "/replybycommentid")
    @ResponseBody
    @ApiOperation(value = "获取一条影评下的所有回复的信息",notes = "")
    @ApiImplicitParam(paramType="path", name = "commentid", value = "用户ID", required = true, dataType = "Integer")
    private Layui getReplyByCommentId(HttpServletRequest request){
        Integer commentId=HttpServletRequestUtil.getInt(request,"commentid");
        List<VeiwMovieReply>list=new ArrayList<>();
        list=replyService.getRelyByCommentId(commentId);
        if (list.size()>0){
            return Layui.select(list.size(),list,"单条影评回复查询成功！");
        }else {
            return Layui.fail("当前影评没有回复！");
        }
    }


    /**
     * 添加回复
     *
     * @param movieReply
     * @return json
     */
    @RequestMapping(value = "/addreply")
    @ResponseBody
    @ApiOperation(value = "在某个影评下回复",notes = "")
    @ApiImplicitParam(paramType="body", name = "newPassword", value = "新密码", required = true, dataType = "String")
    private Layui addReply(@RequestBody MovieReply movieReply) {
        movieReply.setCreateTime(new Date());
        movieReply.setState(0);
        int num = replyService.addMovieReply(movieReply);
        if (num > 0) {
            return Layui.success("回复成功！");
        } else {
            return Layui.fail("回复失败！");
        }
    }


    /**
     * 删除回复
     *
     * @param movieReply
     * @return json
     */
    @RequestMapping(value = "/delectreply")
    @ResponseBody
    @ApiOperation(value = "删除回复",notes = "")
    @ApiImplicitParam(paramType="body", name = "movieReply", value = "回复", required = true, dataType = "MovieReply")
    private Layui delectreply(@RequestBody MovieReply movieReply) {
        movieReply.setCreateTime(new Date());
        int num = replyService.delectMovieReply(movieReply);
        if (num > 0) {
            return Layui.success("回复删除成功！");
        } else {
            return Layui.fail("回复删除失败！");
        }
    }
}
