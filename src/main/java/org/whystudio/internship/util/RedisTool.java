package org.whystudio.internship.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.concurrent.TimeUnit;

/**
 * redis操作的工具类
 * @Author Mrruan
 */
@Component
@Slf4j
public class RedisTool {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    public static RedisTool redisTool;

    @PostConstruct
    public void init(){
        redisTool = this;
    }

    /**
     *  从redis中读取数据
     * @param key key
     * @return
     */
    public String readDataFromRedis(String key) {
        ValueOperations<String, String> valueOperations = stringRedisTemplate.opsForValue();
        return valueOperations.get(key);
    }

    /**
     *  存储数据到redis中
     * @param key key
     * @param value 值
     * @param min 分钟
     */
    public void setDataToRedis(String key, String value, Integer min) {
        ValueOperations<String, String> valueOperations = stringRedisTemplate.opsForValue();
        valueOperations.set(key, value, min, TimeUnit.MINUTES);
    }

    public static RedisTool getInstance(){
        return redisTool;
    }

}
