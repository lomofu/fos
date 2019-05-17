package com.controller.useradmin;

import com.dto.Layui;
import com.entity.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.UserService;
import com.util.HttpServletRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsFileUploadSupport;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 注册用户
     * @param request
     * @return json格式
     */

    @RequestMapping(value = "/register",method = RequestMethod.POST )
    @ResponseBody
    private Layui addUser(HttpServletRequest request){
        Layui layui=new Layui();
        String userString= HttpServletRequestUtil.getString(request,"userString");
        ObjectMapper mapper=new ObjectMapper();
        User user=null;
        try {
            user=mapper.readValue(userString,User.class);
        } catch (Exception e) {
            return Layui.addfail(e);
        }

        //接受图片，并解析为string
        CommonsMultipartFile userImg=null;
        CommonsMultipartResolver commonsMultipartResolver=new CommonsMultipartResolver(request.getSession().getServletContext());
        if (commonsMultipartResolver.isMultipart(request)){
            MultipartHttpServletRequest multipartHttpServletRequest=(MultipartHttpServletRequest)request;
            userImg=(CommonsMultipartFile)multipartHttpServletRequest.getFile("userImg");

        }else {
            Exception e=new RuntimeException("图片为空");
            Layui.addfail(e);
        }

        if (user!=null&&userImg!=null){
            try {
                layui=userService.addUser(user,userImg.getInputStream(),userImg.getOriginalFilename());
            } catch (Exception e) {
                Layui.addfail(e);
            }
        }

    return layui;

    }


}
