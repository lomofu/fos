package com.util;


import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JWTUtils {

    /**
     * 公钥
     */
    private static String SECRET = "lomofu";  //此处随便设置一个自己的加密符号

    public static String createToken(String userId) throws Exception {
        // 签发时间
        Date iatDate = new Date();

        // 过期时间，7天时间
        Calendar nowTime = Calendar.getInstance();
        nowTime.add(Calendar.HOUR, 24 * 7);
        Date experiesDate = nowTime.getTime();

        Map<String, Object> header = new HashMap<String, Object>();
        header.put("typ", "JWT");
        header.put("alg", "HS256");
        String token = JWT.create()
                .withHeader(header)
                .withClaim("userId", userId)
                .withExpiresAt(experiesDate) // 设置过期的日期
                .withIssuedAt(iatDate) // 签发时间
                .sign(Algorithm.HMAC256(SECRET)); // 加密
        System.out.println("生成的token："+token);
        return token;
    }


    /**
     * 解密
     */
    public static Map<String, Claim> verifyToken(String token) throws UnsupportedEncodingException {
        if (token != null) {
            JWTVerifier verifier = JWT.require(Algorithm.HMAC256(SECRET)).build();
            DecodedJWT jwt = verifier.verify(token);  //核实token
            //返回的是解析完的token，是一个map，里面有userId键值对
            if (jwt != null) {
                return jwt.getClaims();
            } else {
                return null;
            }
        }else {
            return null;
        }
    }



}
