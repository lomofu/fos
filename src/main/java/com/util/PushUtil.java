package com.util;

import com.entity.MovieComment;
import com.entity.User;
import io.goeasy.GoEasy;

public class PushUtil {


    private static String host="http://rest-hangzhou.goeasy.io";
    private static String key="BC-696d48c8c9794fb6a2ad85230c12365a";

    public static void push(MovieComment movieComment, User user){
        GoEasy goEasy = new GoEasy(host,key);
        String content=user.getUserName()+" : "+movieComment.getContent();
        goEasy.publish(user.getUserId().toString(),content);
    }
}
