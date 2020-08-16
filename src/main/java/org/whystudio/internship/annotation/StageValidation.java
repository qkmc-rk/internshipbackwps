package org.whystudio.internship.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 控制学生能否登录,控制填写阶段,检验当前阶段能否让学生填写.
 * @author Ning
 */
@Target(value = ElementType.METHOD)
@Retention(value = RetentionPolicy.RUNTIME)
public @interface StageValidation {
    /* 类型 鉴定表 or 报告册 */
    int type();

    /* 阶段 */
    int stage();

    /* 是否是在判断登录 */
    boolean isLogin() default false;
}
