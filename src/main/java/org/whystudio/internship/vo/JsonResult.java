package org.whystudio.internship.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.Date;

/**
 * 后台返回数据给前台的样子
 * @param <T> 泛型数据
 */
@Data
public class JsonResult<T> {
    @JsonProperty("status")
    private Integer status;
    @JsonProperty("message")
    private String message;
    @JsonProperty("data")
    private T data;
    @JsonProperty("timestamp")
    private Date timestamp = new Date();
}
