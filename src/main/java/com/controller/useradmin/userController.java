package com.controller.useradmin;

import com.dto.Layui;
import com.entity.User;
import com.service.UserService;
import com.util.HttpServletRequestUtil;
import com.util.JedisUtils;
import com.util.SpringMD5;
import com.validator.ValidatorFactory;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/user")
@Api(value = "Usercontroller|用户控制器")
public class userController {
    @Autowired
    private UserService userService;
    @Autowired
    private ValidatorFactory validatorFactory;
    //返回校验结果
    boolean v;


    /**
     * 登录方法
     *
     * @param request
     * @return json类型
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "登陆",notes = "")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType="query", name = "request", value = "请求", required = true, dataType = "HttpServletRequest"),
            @ApiImplicitParam(paramType="body", name = "user", value = "用户", required = true, dataType = "User")
    })
     private Layui loginUser(HttpServletRequest request, @RequestBody User user)  {
      return userService.login(user,request);
    }


    /**
     * 判断是否登录
     *
     * @param session,request
     * @return json字符串
     */
    @RequestMapping(value = "/islogin", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "登陆状态判断",notes = "")
    @ApiImplicitParam(paramType="path", name = "request", value = "请求", required = true, dataType = "HttpServletRequest")
    private Layui isLogin(HttpSession session, HttpServletRequest request) throws Exception {
        String usertoken = HttpServletRequestUtil.getTokenFromRedis(request);
        if (usertoken != null) {
            User user= (User) session.getAttribute("user");
            String userId=user.getUserId().toString();
            return Layui.success("当前有用户！", userId);
        } else {
            return Layui.fail("无用户登录！");
        }

    }


    /**
     * 退出登录
     *
     * @param session
     * @return JSON 字符串
     */
    @RequestMapping(value = "/quit", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "退出登陆",notes = "")
    @ApiImplicitParam(paramType="path", name = "request", value = "请求", required = true, dataType = "HttpServletRequest")
    private Layui loginOut(HttpSession session) {
        User user=(User) session.getAttribute("user");
        JedisUtils.deleteToken(String.valueOf(user.getUserId()));
        session.removeAttribute("user");
        return Layui.success("登出成功!");
    }


    /**
     * 注册用户
     *
     * @param request
     * @return json格式
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "用户注册",notes = "前后端都进行校验")
    @ApiImplicitParam(paramType="path", name = "request", value = "请求", required = true, dataType = "HttpServletRequest")
    private Layui addUser(HttpServletRequest request) throws Exception {
        User user = HttpServletRequestUtil.JsonToClass(request);
        CommonsMultipartFile userImg = HttpServletRequestUtil.getUserImg(request);
        //校验
        v = validatorFactory.CreateRegisterVali(user);
        if (v) {
            if (user != null && userImg != null) {
                userService.addUser(user, userImg.getInputStream(), userImg.getOriginalFilename());
                return Layui.add(1);

            } else {
                return Layui.fail("用户信息不完整！");
            }
        } else {
            return Layui.fail("用户已存在!");
        }
    }


    /**
     * 更新用户信息
     *
     * @param user    前端传入的json包装为对象
     * @param session
     * @return json
     */
    @RequestMapping(value = "/updateuserinfo", method = {RequestMethod.POST})
    @ResponseBody
    @ApiOperation(value = "更新用户信息",notes = "")
    @ApiImplicitParam(paramType="body", name = "user", value = "用户", required = true, dataType = "User")
    private Layui updateUser(@RequestBody User user, HttpSession session) {
        if (user != null) {
            userService.updateUserInfo(user);
            session.setAttribute("user", userService.find(user));
            return Layui.success("更新信息成功!");

        } else {
            return Layui.fail("更新失败！");
        }
    }


    /**
     * 修改密码
     *
     * @param user    前端传入的json包装对象
     * @param session
     * @return json
     */
    @RequestMapping(value = "/updatepassword", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "修改用户密码",notes = "")
    @ApiImplicitParam(paramType="body", name = "user", value = "用户", required = true, dataType = "User")
    private Layui updatePassword(@RequestBody User user, HttpSession session) {
        if (user != null) {
            user.setPassword(SpringMD5.passwordMD5(user.getPassword()));
            userService.updateUserInfo(user);
            return Layui.success("更新密码成功！");
        } else {
            return Layui.fail("密码修改失败！");
        }


    }


    /**
     * 更新头像
     *
     * @param multipartFile 前端传入的图片流
     * @param session
     * @return json
     * @throws IOException
     */
    @RequestMapping(value = "/updateuserimg", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "修改用户头像",notes = "")
    @ApiImplicitParam(paramType="query", name = "multipartFile", value = "上传文件", required = true, dataType = "CommonsMultipartFile")
    private Layui updateUserImg(@RequestParam(value = "file", required = false) CommonsMultipartFile multipartFile, HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        if (multipartFile != null && multipartFile.getSize() > 0 && user != null) {
            userService.updateUserImg(user, multipartFile.getInputStream(), multipartFile.getOriginalFilename());
            session.setAttribute("user", userService.find(user));
            return Layui.success("更新头像成功！", user.getUserImg());

        } else {
            return Layui.fail("更新失败！");
        }
    }
}