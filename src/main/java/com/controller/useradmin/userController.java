package com.controller.useradmin;

import com.dto.Layui;
import com.entity.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.UserService;
import com.util.HttpServletRequestUtil;
import com.util.SpringMD5;
import com.validator.ValidatorFactory;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsFileUploadSupport;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/user")
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
    private Layui loginUser(HttpServletRequest request, @RequestBody User user) {
        //数据库结果
        User result = new User();
        //前端传回来的用户名和密码
        String username = user.getUserName();
        String password = SpringMD5.passwordMD5(user.getPassword());

        if (username.matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")) {
            user.setEmail(username);
            result = userService.login(user);

        } else if (username.matches("^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$")) {
            user.setPhone(username);
            result = userService.login(user);
        } else {
            user.setUserName(username);
            result = userService.login(user);
        }
        return valicatePassword(result, password, request);

    }

    private Layui valicatePassword(User result, String password, HttpServletRequest request) {
        if (result != null) {
            if (result.getPassword().equals(password)) {
                request.getSession().setAttribute("user", result);
            } else {
                return Layui.fail("密码错误！");
            }
            return Layui.select(1, result, "登录成功");
        } else {
            return Layui.fail("用户不存在！");

        }
    }


    /**
     * 判断是否登录
     *
     * @param session
     * @return json字符串
     */
    @RequestMapping(value = "/islogin", method = RequestMethod.GET)
    @ResponseBody
    private Layui isLogin(HttpSession session) {

        if (session.getAttribute("user") == null) {
            return Layui.fail("无用户登录");
        } else {
            return Layui.success("当前有用户", 1);
        }
    }

    @RequestMapping(value = "/quit", method = RequestMethod.GET)
    @ResponseBody
    private Layui loginOut(HttpSession session) {
        try {
            session.removeAttribute("user");
            return Layui.success("登出成功", 1);
        } catch (Exception e) {
            return Layui.fail("出现登出错误");
        }

    }


    /**
     * 注册用户
     *
     * @param request
     * @return json格式
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    private Layui addUser(HttpServletRequest request) {
        String userString = HttpServletRequestUtil.getString(request, "userString");
        ObjectMapper mapper = new ObjectMapper();
        User user = null;
        try {
            user = mapper.readValue(userString, User.class);
        } catch (Exception e) {
            Layui.fail(e.getMessage());
        }
        //接受图片，并解析为string
        CommonsMultipartFile userImg = null;
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        if (commonsMultipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
            userImg = (CommonsMultipartFile) multipartHttpServletRequest.getFile("userImg");

        } else {
            return Layui.fail("图片解析错误！");
        }
        user.setPassword(SpringMD5.passwordMD5(user.getPassword()));
        try {
            v = validatorFactory.CreateRegisterVali(user);
        }catch (Exception e){
            v = false;
            e.printStackTrace();
            System.out.println("出错");
        }
        if (v) {
            if (user != null && userImg != null) {
                try {
                    userService.addUser(user, userImg.getInputStream(), userImg.getOriginalFilename());
                    request.getSession().setAttribute("user",user);
                    return Layui.add(1);
                } catch (Exception e) {
                    return Layui.fail("注册失败！" + e.getMessage());
                }
            } else {
                return Layui.fail("注册用户失败！");
            }
        } else {
            return Layui.fail("用户已存在");
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
    private Layui updateUser(@RequestBody User user, HttpSession session) {
        if (user != null) {
            userService.updateUserInfo(user);
            session.setAttribute("user", userService.login(user));
            return Layui.success("更新信息成功!", 1);

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
    private Layui updatePassword(@RequestBody User user, HttpSession session) {
        if (user != null) {
            user.setPassword(SpringMD5.passwordMD5(user.getPassword()));
            userService.updateUserInfo(user);
            return Layui.success("更新密码成功！", 1);
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
    private Layui updateUserImg(@RequestParam(value = "file", required = false) CommonsMultipartFile multipartFile, HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        if (multipartFile != null && multipartFile.getSize() > 0 && user != null) {
            userService.updateUserImg(user, multipartFile.getInputStream(), multipartFile.getOriginalFilename());
            session.setAttribute("user", userService.login(user));
            return Layui.success("更新成功！", user.getUserImg());
        } else {
            return Layui.fail("更新失败！");

        }
    }
}