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
@ApiModel(value="Reportdate对象", description="")
public class Reportdate implements Serializable {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "学号")
    private String stuno;

    @ApiModelProperty(value = "阶段1时间段")
    private String stage1Duration;

    @ApiModelProperty(value = "阶段1填写时间")
    private LocalDateTime stage1Fill;

    @ApiModelProperty(value = "阶段1评价评分时间")
    private LocalDateTime stage1Grade;

    @ApiModelProperty(value = "阶段2时间段")
    private String stage2Duration;

    @ApiModelProperty(value = "阶段2填写时间")
    private LocalDateTime stage2Fill;

    @ApiModelProperty(value = "阶段2评分评价时间")
    private LocalDateTime stage2Grade;


}
