package org.whystudio.internship.exception;

import com.baomidou.mybatisplus.extension.api.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.vo.JsonResult;

@Slf4j
@RestControllerAdvice
public class RRExceptionHandler {

    /**
     * 处理自定义异常
     */
    @ExceptionHandler(RRException.class)
    public JsonResult handleRRException(RRException e) {
        return ControllerUtil.customResult(e.getCode(), isSqlException(e.getMsg()), null);
    }

    @ExceptionHandler(NoHandlerFoundException.class)
    public JsonResult handlerNoFoundException(Exception e) {
        log.error(e.getMessage(), e);
        return ControllerUtil.customResult(404, "路径不存在，请检查路径是否正确", null);
    }

    @ExceptionHandler(DuplicateKeyException.class)
    public JsonResult handleDuplicateKeyException(DuplicateKeyException e) {
        log.error(e.getMessage(), e);
        return ControllerUtil.getFalseResultMsgBySelf("数据库中已存在该记录");
    }


    @ExceptionHandler(Exception.class)
    public JsonResult handleException(Exception e) {
        log.error(e.getMessage(), e);
        return ControllerUtil.getFalseResultMsgBySelf(isSqlException(e.getMessage()));
    }

    /**
     *  判断是否是 sql 错误, 若是不返回sql错误
     * @param msg 错误信息
     * @return  处理后的错误信息
     */
    private String isSqlException(String msg){
        if (msg.contains("java.sql") || msg.contains("mysql") || msg.contains("XPATH") || msg.contains("xpath")
                || msg.contains("root")  || msg.contains("password") || msg.contains("localhost") || msg.contains("internship")
                || msg.contains("sql") ){
            return "数据库访问异常";
        } else {
            return msg;
        }
    }
}
