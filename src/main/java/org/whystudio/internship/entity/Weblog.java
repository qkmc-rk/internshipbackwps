package org.whystudio.internship.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDateTime;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "Weblog对象", description = "接口访问日志")
public class Weblog implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 操作描述
     */
    private String description;


    /**
     * 操作用户
     */
    private String account;


    /**
     * 操作时间
     */
    private LocalDateTime starttime;


    /**
     * 消耗时间
     */
    private Integer spendtime;


    /**
     * URI
     */
    private String uri;


    /**
     * URL
     */
    private String url;


    /**
     * 请求类型
     */
    private String method;


    /**
     * IP地址
     */
    private String ip;


    /**
     * 请求参数
     */
    private String parameter;


    /**
     * 请求返回的结果
     */
    private String result;


}