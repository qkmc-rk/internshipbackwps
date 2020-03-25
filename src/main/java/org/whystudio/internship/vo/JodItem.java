package org.whystudio.internship.vo;

import lombok.Data;

/**
 * jod转换任务的元素, 每个元素
 */
@Data
public class JodItem {
    // 学号
    private String stuno;
    // type true - 报告册 | false - 鉴定表
    private Boolean report;

}
