package com.dto;

import java.util.HashMap;
import java.util.List;

public class Layui  extends HashMap<String, Object> {
//操作成功返回的
    public static Layui success(Integer count, List<?> data){
        Layui r = new Layui();
        r.put("code", 200);
        r.put("msg", "操作成功");
        r.put("count", count);
        r.put("data", data);
        return r;
    }

    //操作失败返回的
    public static Layui fail(Exception e){
        Layui r = new Layui();
        r.put("code", 400);
        r.put("msg", e.toString());
        return r;
    }
}
