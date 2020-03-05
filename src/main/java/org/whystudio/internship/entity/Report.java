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
 * 
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Report对象", description="")
public class Report implements Serializable {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "关联学生学号")
    private String stuno;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime created;

    @ApiModelProperty(value = "修改时间")
    private LocalDateTime modified;

    @ApiModelProperty(value = "第一阶段指导方式")
    private String stage1GuideWay;

    @ApiModelProperty(value = "第一阶段实习总结")
    private String stage1Summary;

    @ApiModelProperty(value = "第一阶段学院实习指导教师评语")
    private String stage1Comment;

    @ApiModelProperty(value = "第一阶段实习成绩评定")
    private String stage1Grade;

    @ApiModelProperty(value = "第二阶段实习指导方式")
    private String stage2GuideWay;

    @ApiModelProperty(value = "第二阶段实习总结")
    private String stage2Summary;

    @ApiModelProperty(value = "第二阶段学院实习导师评语")
    private String stage2Comment;

    @ApiModelProperty(value = "第二阶段实习成绩评定")
    private String stage2Grade;

    @ApiModelProperty(value = "学院实习指导老师总评价")
    private String totalEval;

    @ApiModelProperty(value = "学院实习指导老师总评优良中差")
    private String totalGrade;


}
