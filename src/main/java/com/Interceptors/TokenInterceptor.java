package com.Interceptors;

import com.auth0.jwt.interfaces.Claim;
import com.util.JWTUtils;
import com.util.JedisUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;


public class TokenInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        System.out.println("=====================================================");
        System.out.println("*********************执行拦截************************");
        System.out.println("=====================================================");

        //拿到用户请求的token
        String token = (String) request.getHeader("Authorization");
        System.out.println();
        System.out.println("请求的token："+token);
        System.out.println();


        //没有token
        if (token==null||token.isEmpty()) {
            System.out.println("=====================================================");
            System.out.println("*********************未登录状态************************");
            System.out.println("=====================================================");
            response.sendRedirect(request.getContextPath());
            return false;

        } else {

            //缓存中的token
            Map<String, Claim> verifyToken = JWTUtils.verifyToken(token);
            String userId = verifyToken.get("userId").asString();
            String usertoken = JedisUtils.getToken(userId);
            if (usertoken != null) {
                System.out.println("=====================================================");
                System.out.println("*********************token验证成功********************");
                System.out.println("=====================================================");
                return true;

            }else {
                System.out.println("=====================================================");
                System.out.println("*********************token已经失效********************");
                System.out.println("=====================================================");
                response.sendRedirect(request.getContextPath());
                return false;
            }
        }
    }
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
