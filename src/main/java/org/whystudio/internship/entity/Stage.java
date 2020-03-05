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
 * 状态控制表,当前填写第几阶段，实习报告册1和鉴定表0，分别为三个阶段。报告册：学生填写阶段1，学生填写阶段2，教师评定阶段。鉴定表：学生实习总结，学生实习陈述，教师总结评定。
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Stage对象", description="状态控制表,当前填写第几阶段，实习报告册1和鉴定表0，分别为三个阶段。报告册：学生填写阶段1，学生填写阶段2，教师评定阶段。鉴定表：学生实习总结，学生实习陈述，教师总结评定。")
public class Stage implements Serializable {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "学院代码")
    private String collegecode;

    @ApiModelProperty(value = "阶段1,阶段2,阶段3")
    private Integer stage;

    @ApiModelProperty(value = "操作时间")
    private LocalDateTime created;

    @ApiModelProperty(value = "1 控制报告册 0控制鉴定表")
    private Boolean isreport;


}
