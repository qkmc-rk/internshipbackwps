package org.whystudio.internship.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * mybatis分页拦截器配置
 * 若不配置此文件，分页将不起作用
 */
@Configuration
public class MyBatisPlusPageConfig {

    @Bean
    PaginationInterceptor getPaginationInterceptor(){
        return new PaginationInterceptor();
    }
}
