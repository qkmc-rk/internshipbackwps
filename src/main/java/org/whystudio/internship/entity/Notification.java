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
 * 实习单位发布通知

 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Notification对象", description="实习单位发布通知")
public class Notification implements Serializable {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "标题")
    private String title;

    private LocalDateTime created;

    private LocalDateTime modified;

    @ApiModelProperty(value = "内容")
    private String content;

    @ApiModelProperty(value = "发布者")
    private String publisher;

    @ApiModelProperty(value = "阅读数量")
    private Integer readnum;

    @ApiModelProperty(value = "点赞")
    private Integer praise;

    @ApiModelProperty(value = "踩")
    private Integer low;


}
