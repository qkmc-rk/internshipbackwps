package org.whystudio.internship.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 学生信息
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Student对象", description="学生信息")
public class Student implements Serializable {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "学号")
    private String stuno;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "姓名")
    private String name;

    @ApiModelProperty(value = "年龄")
    private Integer age;

    @ApiModelProperty(value = "性别")
    private String sex;

    @ApiModelProperty(value = "电话")
    private String phone;

    @ApiModelProperty(value = "qq")
    private String qq;

    @ApiModelProperty(value = "微信")
    private String wechat;

    @ApiModelProperty(value = "身份证号")
    private String idcard;

    @ApiModelProperty(value = "学院")
    private String college;

    @ApiModelProperty(value = "学院代码")
    private String collegecode;

    @ApiModelProperty(value = "专业")
    private String major;

    @ApiModelProperty(value = "专业代码")
    private String majorcode;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime created;

    @ApiModelProperty(value = "更新时间")
    private LocalDateTime modified;

    @ApiModelProperty(value = "状态1启用 0停用")
    private Boolean status;

    @ApiModelProperty(value = "实习企业")
    private String corp;

    @ApiModelProperty(value = "实习岗位")
    private String position;

    @ApiModelProperty(value = "实习开始时间")
    private LocalDateTime starttime;

    @ApiModelProperty(value = "实习结束时间")
    private LocalDateTime endtime;

    @ApiModelProperty(value = "导师工号")
    private String teachno;

}
