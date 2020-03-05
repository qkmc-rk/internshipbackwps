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
 * 鉴定表的时间项
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Appraisaldate对象", description="鉴定表的时间项")
public class Appraisaldate implements Serializable {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "学号")
    private String stuno;

    @ApiModelProperty(value = "校外导师填表时间")
    private LocalDateTime corpteacher;

    @ApiModelProperty(value = "实习单位填表时间")
    private LocalDateTime corp;

    @ApiModelProperty(value = "学院导师填表时间")
    private LocalDateTime teacher;

    @ApiModelProperty(value = "综合成绩评定时间")
    private LocalDateTime synth;

    @ApiModelProperty(value = "学院领导填表时间")
    private LocalDateTime leader;


}
