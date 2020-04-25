package org.whystudio.internship.aop;

import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.whystudio.internship.entity.Weblog;
import org.whystudio.internship.service.IWeblogService;
import org.whystudio.internship.util.IpTool;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.vo.JsonResult;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 记录接口日志
 */
@Slf4j
@Order(1)
@Aspect
@Component
public class WeblogAspect {

    @Autowired
    IWeblogService weblogService;

    @Pointcut("execution(public * org.whystudio.internship.controller.*.*(..))")
    public void weblog() {

    }

    @Before("weblog()")
    public void doBefore(JoinPoint joinPoint) throws Throwable {

    }

    @AfterReturning(value = "weblog()", returning = "ret")
    public void doAfterReturning(Object ret) throws Throwable {

    }

    @Around("weblog()")
    public Object doAround(ProceedingJoinPoint joinPoint) throws Throwable {
        LocalDateTime startTime = LocalDateTime.now();
        Weblog weblog = new Weblog();
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();
        if (method.isAnnotationPresent(ApiOperation.class)) {
            ApiOperation apiOperation = method.getAnnotation(ApiOperation.class);
            weblog.setDescription(apiOperation.value());
        }
        LocalDateTime endTime = LocalDateTime.now();
        String token = request.getHeader("token");
        if (null != token) {
            weblog.setAccount(JWTTool.findToken(token));

        }
        weblog.setUrl(request.getRequestURL().toString());
        weblog.setUri(request.getRequestURI());
        weblog.setIp(IpTool.getIpAddr(request));
        weblog.setMethod(request.getMethod());
        weblog.setParameter(getParameter(method, joinPoint.getArgs()));
        weblog.setSpendtime((int) Duration.between(startTime, endTime).toMillis());
        weblog.setStarttime(startTime);
        log.info(String.valueOf(weblog));
        weblogService.save(weblog);
        return weblog;
    }


    /**
     * 获取方法传入的参数
     *
     * @param method
     * @param args
     * @return
     */
    private String getParameter(Method method, Object[] args) {
        List<Object> argList = new ArrayList<>();
        Parameter[] parameters = method.getParameters();
        for (int i = 0; i < parameters.length; i++) {
            //将RequestBody注解修饰的参数作为请求参数
            RequestBody requestBody = parameters[i].getAnnotation(RequestBody.class);
            if (requestBody != null) {
                argList.add(args[i]);
            }
            //将RequestParam注解修饰的参数作为请求参数
            RequestParam requestParam = parameters[i].getAnnotation(RequestParam.class);
            if (requestParam != null) {
                Map<String, Object> map = new HashMap<>();
                String key = parameters[i].getName();
                if (!StringUtils.isEmpty(requestParam.value())) {
                    key = requestParam.value();
                }
                map.put(key, args[i]);
                argList.add(map);
            }
        }
        if (argList.size() == 0) {
            return null;
        } else if (argList.size() == 1) {
            return argList.get(0).toString();
        } else {
            return argList.toString();
        }
    }


}
