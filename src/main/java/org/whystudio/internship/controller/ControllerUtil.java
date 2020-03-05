package org.whystudio.internship.controller;

import org.whystudio.internship.vo.Const;
import org.whystudio.internship.vo.JsonResult;


/**
 * controller工具, 可以快速生成返回数据
 */
public class ControllerUtil {

    /**
     * 代码这个东西浓缩就是精华
     * @param rs 真真假假
     * @return 假假真真
     */
    public static JsonResult getTrueOrFalseResult(boolean rs) {
        JsonResult jsonResult = new JsonResult();
        if (rs){
            jsonResult.setStatus(Const.OPERATION_SUCCESS);
        }
        else{
            jsonResult.setStatus(Const.COMMON_ERROR);
            jsonResult.setMessage("COMMON ERROR HAPPENED,METHOD RETURN WITH FALSE.");
        }
        return jsonResult;
    }

    public static <T> JsonResult<T> getDataResult(T data) {
        JsonResult<T> jsonResult = new JsonResult<>();
        if (null != data){
            jsonResult.setMessage("OPERATION SUCCESS");
            jsonResult.setStatus(Const.OPERATION_SUCCESS);
            jsonResult.setData(data);
        } else{
            jsonResult.setMessage("OPERATION FAILED,CURRENT METHOD NO DATA GAIN");
            jsonResult.setStatus(Const.COMMON_ERROR);
        }
        return jsonResult;
    }

    public static <T> JsonResult<T> getSuccessResultBySelf(T data) {
        JsonResult jsonResult = new JsonResult<>();
        jsonResult.setData(data);
        jsonResult.setStatus(Const.OPERATION_SUCCESS);
        jsonResult.setMessage("SUCCESS RESULT");
        return jsonResult;
    }

    public static <T> JsonResult<T> getFalseResultMsgBySelf(String msg) {
        JsonResult jsonResult = new JsonResult<>();
        jsonResult.setMessage(msg);
        jsonResult.setStatus(Const.COMMON_ERROR);
        return jsonResult;
    }

    /**
     * 自定义返回数据
     * @param status
     * @param msg
     * @param data
     * @param <T>
     * @return
     */
    public static <T> JsonResult<T> customResult(Integer status, String msg, T data){
        JsonResult<T> jsonResult = new JsonResult<>();
        jsonResult.setStatus(status);
        jsonResult.setMessage(msg);
        jsonResult.setData(data);
        return jsonResult;
    }
}
