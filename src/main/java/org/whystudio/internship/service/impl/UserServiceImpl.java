package org.whystudio.internship.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Student;
import org.whystudio.internship.entity.Teacher;
import org.whystudio.internship.mapper.StudentMapper;
import org.whystudio.internship.mapper.TeacherMapper;
import org.whystudio.internship.service.IUserService;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.util.MD5Tool;
import org.whystudio.internship.util.VerifyCodeTool;
import org.whystudio.internship.vo.Const;
import org.whystudio.internship.vo.JsonResult;

import java.util.Date;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    StudentMapper studentMapper;

    @Autowired
    TeacherMapper teacherMapper;

    @Override
    public JsonResult login(String type, String username, String password, String verifyCode, String ip) {
        password = MD5Tool.md5(password);

        //校验验证码
        if (!VerifyCodeTool.verify(ip,verifyCode)){
            VerifyCodeTool.clean(ip);
            return ControllerUtil.customResult(Const.VERIFYCODE_WRONG, "验证码错误", null);
        }
        VerifyCodeTool.clean(ip);
        if(type.equals(Const.TEACHER_TYPE)){
            Teacher teacher = teacherMapper.selectByTeachno(username);
            return loginCommon(teacher, password);
        } else if (type.equals(Const.STUDENT_TYPE)){
            Student student = studentMapper.selectByStuno(username);
            return loginCommon(student, password);
        } else {
            return ControllerUtil.customResult(Const.ROLE_TYPE_WRONG, "角色不正确", null);
        }
    }

    @Override
    public JsonResult findPassword(String idcard, String username, String password, String type, String verifyCode, String ip) {
        //校验验证码
        if (!VerifyCodeTool.verify(ip,verifyCode)){
            VerifyCodeTool.clean(ip);
            return ControllerUtil.customResult(Const.VERIFYCODE_WRONG, "验证码错误", null);
        }
        VerifyCodeTool.clean(ip);
        if(type.equals(Const.TEACHER_TYPE)){
            Teacher teacher = teacherMapper.selectByTeachno(username);
            return changePassword(teacher, password, idcard);
        } else if (type.equals(Const.STUDENT_TYPE)){
            Student student = studentMapper.selectByStuno(username);
            return changePassword(student, password, idcard);
        } else {
            return ControllerUtil.customResult(Const.ROLE_TYPE_WRONG, "角色不正确", null);
        }


    }

    /**
     * 哥哥写的代码妙吗?
     * @param user
     * @param password
     * @param <T>
     * @return
     */
    private <T> JsonResult loginCommon(T user, String password){
        if (null == user){
            return ControllerUtil.customResult(Const.USERNAME_NOT_FOUND, "没有找到账号信息", null);
        }

        if (user instanceof Teacher && !((Teacher)user).getPassword().toLowerCase()
                .equals(password.toLowerCase())){
            return ControllerUtil.customResult(Const.PASSWORD_INVALID, "密码错误", null);
        }
        if (user instanceof Student && !((Student)user).getPassword().toLowerCase()
                .equals(password.toLowerCase())){
            return ControllerUtil.customResult(Const.PASSWORD_INVALID, "密码错误", null);
        }

        //登录成功
        String token = MD5Tool.md5(Long.toString(new Date().getTime()));
        boolean teacherBool = user instanceof Teacher && JWTTool.saveToken(((Teacher)user).getTeachno(), token,90);
        boolean studentBool = user instanceof Student && JWTTool.saveToken(((Student)user).getStuno(), token,90);
        if (teacherBool || studentBool){
            return ControllerUtil.customResult(Const.LOGIN_SUCCESS, "登录成功",token);
        }else {
            return ControllerUtil.customResult(Const.COMMON_ERROR, "保存token出现问题,检查redis服务是否开启", null);
        }
    }

    /**
     * 改变密码
     * @param user
     * @param password
     * @param idcard
     * @param <T>
     * @return
     */
    private <T> JsonResult changePassword(T user, String password, String idcard){
        if (null == user){
            return ControllerUtil.customResult(Const.USERNAME_NOT_FOUND, "没有找到账号信息", null);
        }
        if (user instanceof Teacher && ((Teacher)user).getIdcard().toLowerCase().equals(idcard.toLowerCase())){
            Teacher teacher = (Teacher)user;
            teacher.setPassword(MD5Tool.md5(password).toLowerCase());
            teacherMapper.updateById(teacher);
        } else if (user instanceof Student && ((Student)user).getIdcard().toLowerCase().equals(idcard.toLowerCase())){
            Student student = (Student) user;
            student.setPassword(MD5Tool.md5(password).toLowerCase());
            studentMapper.updateById(student);
        } else {
            return ControllerUtil.customResult(Const.IDCARD_WRONG, "身份证号码不正确, 修改失败!", null);
        }
        return ControllerUtil.getTrueOrFalseResult(true);
    }
}
