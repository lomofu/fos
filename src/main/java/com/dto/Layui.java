package com.dto;

import java.util.HashMap;
import java.util.List;

/**
 *此类用于封装的json格式
 * 提供一个默认的构造方法和两个模板方法
 */

public class Layui  extends HashMap<String, Object> {
    private  Integer code;
    private  String msg;
    private  boolean index;
    private  Integer count;
    private  List<?>data;

    public void setCode(Integer code) {
        this.code = code;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    public void setIndex(boolean index) {
        this.index = index;
    }

    //查询操作成功的模板
    public static Layui selectsuccess(Integer count, List<?> data){
        Layui r = new Layui();
        r.put("code", 200);
        r.put("msg", "操作成功");
        r.put("count", count);
        r.put("data", data);
        return r;
    }
    //添加成功的模板
    public static Layui addsuccess(Integer count){
        Layui r=new Layui();
        r.put("code",200);
        r.put("msg","注册成功");
        r.put("count",count);
        return r;
    }

    //注册操作失败的模板
    public static Layui addfail(Exception e){
        Layui r = new Layui();
        r.put("code", 400);
        r.put("msg","注册失败"+e.toString());
        return r;
    }
    //自定义失败模板
    public static Layui fail(Exception e){
        Layui r = new Layui();
        r.put("code", 400);
        r.put("msg", e.toString());
        return r;
    }

    //默认的模板
    public static Layui put(Integer code,String msg,Integer count, List<?> data){
        Layui r=new Layui();
        r.put("code",code);
        r.put("msg",msg);
        r.put("count",count);
        r.put("data",data);
        return r;
    }



}
