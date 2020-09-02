package org.whystudio.internship.util;

import org.apache.commons.lang3.StringUtils;
import org.whystudio.internship.exception.RRException;
import org.whystudio.internship.vo.Const;

/**
 * 与令牌token相关的操作
 */
public class JWTTool {

    /**
     * 将jwt令牌存到redis中 存两对
     * <username, token>,<token, username>
     *
     * @param username
     * @param token
     * @param period
     * @return true
     */
    public static Boolean saveToken(String username, String token, Integer period) {
        try {
            RedisTool.getInstance().setDataToRedis(username, token, period);
            RedisTool.getInstance().setDataToRedis(token, username, period);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 通过token找到用户
     *
     * @param token JWT令牌
     * @return 用户username
     */
    public static String findToken(String token) {
        if (StringUtils.isBlank(token)) {
            throw new RRException("no token in header");
        }
        String userno = RedisTool.getInstance().readDataFromRedis(token);
        if (StringUtils.isBlank(userno)) {
            throw new RRException("no any token info found");
        }
        return userno;
    }
}
