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
}
