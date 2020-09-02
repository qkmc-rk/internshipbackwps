package org.whystudio.internship.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.whystudio.internship.annotation.Auth;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Student;
import org.whystudio.internship.entity.Teacher;
import org.whystudio.internship.mapper.StudentMapper;
import org.whystudio.internship.mapper.TeacherMapper;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.vo.Const;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: mrruan
 * @email: qkmc@outlook.com
 * @date: 2020-03-24
 * 代替拦截器用于鉴定权限的作用
 */
@Aspect
@Slf4j
@Component
public class AuthAspect {

    @Autowired
    StudentMapper studentMapper;
    @Autowired
    TeacherMapper teacherMapper;

    /**
     * 拦截有注解的方法作为切入点
     */
    @Pointcut("@annotation(org.whystudio.internship.annotation.Auth)")
    public void authPoint() {
    }

    /**
     * 更新token的有效时间
     * 默认已经设置为90min了, 我认为不需要在操作中更新token了 此处先保留
     */
    @Deprecated
    @AfterReturning("@annotation(org.whystudio.internship.annotation.Auth)")
    public void after(){}

    /**
     * @param joinPoint
     * @param auth
     * @return
     */
    @Around("authPoint() && @annotation(auth)")
    public Object intercept(ProceedingJoinPoint joinPoint, Auth auth) throws Throwable {
        Integer needRole = auth.role();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String token = request.getHeader("token");
        String userno = JWTTool.findToken(token);
        Integer realRole = findRole(userno);
        if (realRole == null){
            return ControllerUtil.getFalseResultMsgBySelf("no any role info found");
        }
        // 如果方法对权限无特殊要求或者访问者是管理员 直接放行
        if (realRole.equals(Const.AUTH_ADMIN) || needRole.equals(Const.AUTH_ALL)){
            // 管理员直接放行
            return joinPoint.proceed();
        }else if (!needRole.equals(realRole)){
            return ControllerUtil.getFalseResultMsgBySelf("no permission to perform this op");
        }else {
            return joinPoint.proceed();
        }
    }

    private Integer findRole(String userno) {
        if (findStudent(userno) != null){
            return Const.AUTH_STUDENT;
        }else if (findTeacher(userno) != null){
            return Const.AUTH_TEACHER;
        }
        return null;
    }

    private Student findStudent(String stuno){
        return studentMapper.selectByStuno(stuno);
    }

    private Teacher findTeacher(String teachno){
        return teacherMapper.selectByTeachno(teachno);
    }
}
