package com.util;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisShardInfo;

public class JedisUtils {

    private static Jedis jedis;
    //初始化
    private static void init() {
        JedisShardInfo shardInfo = new JedisShardInfo("redis://localhost:6379/9");
        shardInfo.setPassword("root");//这里是密码
        jedis = new Jedis(shardInfo);
        jedis.connect();
    }
    //在redis中设置键值对存储
    public static void setToken(String username, String token, int day) {
        int second = day * 60 * 60 * 24;
        JedisUtils.init();
        jedis.set(username, token); //根据username存储token
        jedis.expire(username, second);  //设置token持续时间
    }

    public static String getToken(String username) {
        JedisUtils.init();
        String token = jedis.get(username);  //获取token
        return token;
    }

}
