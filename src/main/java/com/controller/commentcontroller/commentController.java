package com.controller.commentcontroller;

import com.dto.Layui;
import com.service.CommentService;
import com.util.HttpServletRequestUtil;
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


    @RequestMapping(value = "usercomment", method = RequestMethod.GET)
    @ResponseBody
    private Layui getUserComment(HttpServletRequest request) {
        List<ViewUserComment> list = new ArrayList<ViewUserComment>();
        Integer userId=HttpServletRequestUtil.getInt(request,"userId");
        list = commentService.getAllCommentByUserId(userId);
        if (list.size() > 0) {
            return Layui.select(list.size(), list, "查询成功");
        } else {
            return Layui.fail("无评论");
        }


    }

}
