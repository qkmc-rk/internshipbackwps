package org.whystudio.internship.service;

import org.whystudio.internship.vo.JsonResult;

public interface IUserService {
    /**
     * 登录接口, 学生和老师统一处理
     * @param type
     * @param username
     * @param password
     * @param verifyCode
     * @param ip
     * @return
     */
    JsonResult login(String type, String username, String password, String verifyCode, String ip);

    /**
     * 找回密码接口 通过身份证验证
     * @param idcard 身份证
     * @param username 用户名
     * @param password 密码
     * @param type 类型 student teacher
     * @param verifyCode 验证码
     * @param ipAddr
     * @return
     */
    JsonResult findPassword(String idcard, String username, String password, String type, String verifyCode, String ip);
}
