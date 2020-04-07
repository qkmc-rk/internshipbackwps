package org.whystudio.internship.util;

/**
 * 验证码工具, 生成验证码、存放验证码、
 */
public class VerifyCodeTool {

    /**
     * 将验证码存放到redis, 存IP地址
     * IP地址校验
     * @param ip ip地址
     * @param code 验证码
     */
    public static void setVerifyCodeToRedis(String ip, String code){
        // 验证码有效期30分钟
        RedisTool.getInstance().setDataToRedis(ip,code,30);
    }

    /**
     *
     * 验证 验证码
     * @param ip ip地址
     * @param code 验证码
     * @return
     *
     */
    public static boolean verify(String ip, String code){
        String codeFromRedis = RedisTool.getInstance().readDataFromRedis(ip).toLowerCase();
        code = code.toLowerCase();
        if (null != codeFromRedis && codeFromRedis.equals(code)){
            return true;
        }else {
            return false;
        }
    }


    public static void clean(String ip) {
        //清除验证码
        RedisTool.getInstance().setDataToRedis(ip, "", 1);
    }
}
