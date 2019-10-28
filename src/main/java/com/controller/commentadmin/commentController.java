package com.controller.commentadmin;

import com.dto.Layui;
import com.entity.MovieComment;
import com.entity.User;
import com.service.CommentService;
import com.service.PushService;
import com.service.UserService;
import com.util.HttpServletRequestUtil;
import com.util.PushUtil;
import com.vo.VeiwMovieComment;
import com.vo.ViewUserComment;
import io.swagger.annotations.*;
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
@RequestMapping("/comment")
@Api(value = "commeentController|用来进行评论控制的控制器")
public class commentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;
    @Autowired
    private PushService pushService;


    @RequestMapping(value = "usercommentcount",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取用户影评总数",notes = "根据用户ID进行查询")
    @ApiResponse(code = 400, message = "用户影评总数为0!")
    @ApiImplicitParam(paramType="path", name = "userid", value = "用户ID", required = true, dataType = "Integer")
    private Layui getUserCommentCount(HttpServletRequest request){
        Integer userId = HttpServletRequestUtil.getInt(request, "userid");
        int num=commentService.getAllCommentCountByUserId(userId);
        if (num>0){
            return Layui.success("用户影评查询成功！",num);
        }else {
            return Layui.fail("用户影评总数为0!");
        }
    }

    /**
     * 查询一个用户的所有影评
     *
     * @param request
     * @return json
     */
    @RequestMapping(value = "usercomment", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "查询一个用户所有的影评",notes = "根据用户ID查询")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType="path", name = "userid", value = "用户ID", required = true, dataType = "Integer"),
            @ApiImplicitParam(paramType="path", name = "pagenum", value = "用户ID", required = true, dataType = "Integer")
    })
    private Layui getUserComment(HttpServletRequest request) {
        List<ViewUserComment> list = new ArrayList<ViewUserComment>();
        Integer userId = HttpServletRequestUtil.getInt(request, "userid");
        Integer pageNum = HttpServletRequestUtil.getInt(request,"pagenum");
        list = commentService.getAllCommentByUserId(userId,pageNum,5);
        if (list.size() > 0) {
            return Layui.select(list.size(), list, "查询用户影评成功！");
        } else {
            return Layui.fail("此用户无评论！");
        }


    }


    @RequestMapping(value = "moviecommentcount",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "查询该电影的所有影评的总数",notes = "根据电影ID查询")
    @ApiImplicitParam(paramType="path", name = "movieid", value = "用户ID", required = true, dataType = "Integer")
    private Layui getMovieCommentCount(HttpServletRequest request){
        Integer movieId=HttpServletRequestUtil.getInt(request,"movieid");
        int num=commentService.getAllCommentCountByMovieId(movieId);
        if (num>0){
            return Layui.success("该电影的所有影评数查询成功！",num);
        }else {
            return Layui.fail("该电影的所有影评数为0");
        }

    }

    /**
     * 查询一部电影下的所有影评
     *
     * @param request
     * @return json
     */
    @RequestMapping(value = "moviecomment", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取该电影下的所有影评",notes = "通过电影ID查询")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType="path", name = "movieid", value = "用户ID", required = true, dataType = "Integer"),
            @ApiImplicitParam(paramType="path", name = "pagenum", value = "用户ID", required = true, dataType = "Integer")
    })
    private Layui getMovieComment(HttpServletRequest request) {
        List<VeiwMovieComment> list = new ArrayList<VeiwMovieComment>();
        Integer movieId = HttpServletRequestUtil.getInt(request, "movieid");
        Integer pageNum = HttpServletRequestUtil.getInt(request,"pagenum");
        list = commentService.getAllCommentByMovieId(movieId,pageNum,5);
        if (list.size() > 0) {
            return Layui.select(list.size(), list, "查询电影影评成功！");
        } else {
            return Layui.fail("此电影无评论！");
        }

    }

    /**
     * 添加一条影评
     *
     * @param movieComment
     * @return json
     */
    @RequestMapping(value = "addcomment", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "添加一条影评",notes = "")
    @ApiImplicitParam(paramType="body", name = "movieComment", value = "用户影评", required = true, dataType = "MovieComment")
    private Layui addComment(@RequestBody MovieComment movieComment) {
        movieComment.setCreateTime(new Date());
        movieComment.setState(0);
        if (movieComment.getStart() == null) {
            movieComment.setState(1);
        }
        int num = commentService.addComment(movieComment);
        if (num > 0) {
            User user=new User();
            user=userService.selectByUserId(movieComment.getUser().getUserId());
            PushUtil.push(movieComment,user);
            return Layui.success("影评插入成功！");
        } else {
            return Layui.fail("影评插入失败！");
        }
    }

    /**
     * 更新影评
     *
     * @param movieComment
     * @return json
     */
    @RequestMapping(value = "updatecomment", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "更新影评",notes = "通过用户ID和电影ID标识")
    @ApiImplicitParam(paramType="body", name = "movieComment", value = "用户影评", required = true, dataType = "MovieComment")
    private Layui updatecomment(@RequestBody MovieComment movieComment) {
        movieComment.setCreateTime(new Date());
        movieComment.setState(0);
        int num = commentService.updateComment(movieComment);
        if (num > 0) {
            return Layui.success("影评修改成功！");
        } else {
            return Layui.fail("影评修改失败！");
        }
    }

    /***
     * 删除影评
     * @param movieComment
     * @return json
     */
    @RequestMapping(value = "delectcomment", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "删除影评",notes = "通过用户ID和电影ID标识")
    @ApiImplicitParam(paramType="body", name = "movieComment", value = "用户影评", required = true, dataType = "MovieComment")
    private Layui delectcomment(@RequestBody MovieComment movieComment) {
        movieComment.setCreateTime(new Date());
        movieComment.setState(1);
        int num = commentService.delectComment(movieComment);
        if (num > 0) {
            return Layui.success("影评删除成功！");
        } else {
            return Layui.fail("影评删除失败！");
        }
    }


}
