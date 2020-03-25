package org.whystudio.internship.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;
import java.util.Random;

/**
 * <p>
 *
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Pdf对象", description="报告册或者鉴定表的pdf文件信息")
public class Pdf implements Serializable {

    private static final long serialVersionUID=1L;

    // 默认用户生成ID 为了满足业务逻辑的某个位置 JodService::executeTask
    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "id", type = IdType.INPUT)
    private Long id = Math.abs(new Random().nextLong());

    private String url;

    private String stuno;

    // 是否是报告册, 否则是鉴定表
    private Boolean report;

    private Date created;

    // 是否正在转换
    private Boolean converting;

    // 转换是否失败
    private Boolean failed = false;

}
