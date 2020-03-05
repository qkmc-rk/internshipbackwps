package org.whystudio.internship.entity;

import java.time.LocalDateTime;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 实习企业信息表

 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Corporation对象", description="实习企业信息表 ")
public class Corporation implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = " 主键")
      private Long id;

    @ApiModelProperty(value = " 学号,表示这条记录由某个学生填写")
    private String stuno;

    @ApiModelProperty(value = "统一社会信用代码")
    private String creditcode;

    @ApiModelProperty(value = "企业名称")
    private String corpname;

    @ApiModelProperty(value = "企业注册号")
    private String regcode;

    @ApiModelProperty(value = "类型 (如：有限责任公司)")
    private String type;

    @ApiModelProperty(value = "法人")
    private String legalperson;

    @ApiModelProperty(value = " 注册资本")
    private String registercapital;

    @ApiModelProperty(value = " 创建日期")
    private String createdate;

    @ApiModelProperty(value = "开始营业日期")
    private String startbusiness;

    @ApiModelProperty(value = " 营业期限截止日期")
    private String endbusiness;

    @ApiModelProperty(value = "工商信息登记机关")
    private String regauthority;

    @ApiModelProperty(value = "核准日期")
    private String approvaldate;

    @ApiModelProperty(value = " 登记状态")
    private String regstatus;

    @ApiModelProperty(value = "住所地址")
    private String address;

    @ApiModelProperty(value = "经营范围")
    private String businessScope;

    @ApiModelProperty(value = " 表示该公司信息后台管理员是否已经核实,默认未核实")
    private Boolean ischecked;

    @ApiModelProperty(value = " 数据库记录创建日期")
    private LocalDateTime created;

    @ApiModelProperty(value = " 数据库记录修改日期")
    private LocalDateTime modified;


}
