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
 * 实习鉴定表
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Appraisal对象", description="实习鉴定表")
public class Appraisal implements Serializable {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "学号")
    private String stuno;

    @ApiModelProperty(value = "实习内容")
    private String content;

    @ApiModelProperty(value = "自我总结")
    private String summary;

    @ApiModelProperty(value = "校外导师意见")
    private String corpTeacherOpinion;

    @ApiModelProperty(value = "校外导师打分")
    private String corpTeacherGrade;

    @ApiModelProperty(value = "实习单位意见")
    private String corpOpinion;

    @ApiModelProperty(value = "学院导师成绩评定")
    private String teacherGrade;

    @ApiModelProperty(value = "综合实习成绩评定")
    private String synthGrade;

    @ApiModelProperty(value = "学院实习领导小组意见")
    private String leaderOpinion;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime created;

    @ApiModelProperty(value = "修改时间")
    private LocalDateTime modified;


}
