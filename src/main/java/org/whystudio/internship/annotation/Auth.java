package org.whystudio.internship.annotation;

import org.whystudio.internship.vo.Const;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 此注解用于标记在controller方法上, aop通过此注解判断该方法执行时需要什么权限
 *
 */
@Target(value = ElementType.METHOD)
@Retention(value = RetentionPolicy.RUNTIME)
public @interface Auth {
    /**
     *  使用Const中定义的 AUTH_XXX 参数
     * @return
     */
    int role() default Const.AUTH_ALL;
}
