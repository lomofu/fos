package com.controller.commentcontroller;

import com.dto.Layui;
import com.entity.MovieComment;
import com.service.CommentService;
import com.util.HttpServletRequestUtil;
import com.vo.VeiwMovieComment;
import com.vo.ViewUserComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class commentController {

    @Autowired
    private CommentService commentService;

    /**
     * 查询一个用户的所有影评
     * @param request
     * @return json
     */
    @RequestMapping(value = "usercomment", method = RequestMethod.GET)
    @ResponseBody
    private Layui getUserComment(HttpServletRequest request) {
        List<ViewUserComment> list = new ArrayList<ViewUserComment>();
        Integer userId=HttpServletRequestUtil.getInt(request,"userId");
        list = commentService.getAllCommentByUserId(userId);
        if (list.size() > 0) {
            return Layui.select(list.size(), list, "查询用户影评成功！");
        } else {
            return Layui.fail("此用户无评论！");
        }


    }

    /**
     * 查询一部电影下的所有影评
     * @param request
     * @return
     */
    @RequestMapping(value = "moviecomment", method = RequestMethod.GET)
    @ResponseBody
    private Layui getMovieComment(HttpServletRequest request) {
        List<VeiwMovieComment> list = new ArrayList<VeiwMovieComment>();
        Integer movieId=HttpServletRequestUtil.getInt(request,"movieid");
        list=commentService.getAllCommentByMovieId(movieId);
        if (list.size() > 0) {
            return Layui.select(list.size(), list, "查询电影影评成功！");
        } else {
            return Layui.fail("此电影无评论！");
        }

    }

    @RequestMapping(value = "addcomment",method = RequestMethod.POST)
    @ResponseBody
    private Layui addComment(@RequestBody MovieComment movieComment){return null;}

}
