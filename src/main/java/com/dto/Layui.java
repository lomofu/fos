package com.dto;

import java.util.HashMap;
import java.util.List;

/**
 *此类用于封装的json格式
 * 提供一个默认的构造方法和两个模板方法
 */

public class Layui  extends HashMap<String, Object> {
    //默认的构造
    public static Layui put(Integer code,String msg,Integer count, List<?> data){
        Layui r=new Layui();
        r.put("code",code);
        r.put("msg",msg);
        r.put("count",count);
        r.put("data",data);
        return r;
    }


    //操作成功的模板
    public static Layui success(Integer count, List<?> data){
        Layui r = new Layui();
        r.put("code", 200);
        r.put("msg", "操作成功");
        r.put("count", count);
        r.put("data", data);
        return r;
    }

    //操作失败的模板
    public static Layui fail(Exception e){
        Layui r = new Layui();
        r.put("code", 400);
        r.put("msg", e.toString());
        return r;
    }
}
