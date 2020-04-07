package org.whystudio.internship.controller;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.vo.JsonResult;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 全局错误处理, 避免暴露敏感信息
 *
 * @author : Nadev
 * @since: 2020-03-08
 */
@Slf4j
@ApiIgnore
@RestController
@CrossOrigin
public class HttpErrorController implements ErrorController {

    // 发生错误时跳转的uri
    private final static String ERROR_PATH = "/error";

    @RequestMapping(path = ERROR_PATH)
    public JsonResult error(HttpServletRequest request, HttpServletResponse response) {
        String message = "访问 " + request.getRequestURI() + " 时发生错误, 错误代码: " + response.getStatus();
        String token = request.getHeader("token");
        if (StringUtils.isNotBlank(token)) {
            String userNo = JWTTool.findToken(token);
            if (StringUtils.isNotBlank(userNo)) {
                log.error("用户 " + userNo + message);
            } else {
                log.error(message);
            }
        } else {
            log.error(message);
        }
        return ControllerUtil.getFalseResultMsgBySelf(message);
    }

    /**
     * Returns the path of the error page.
     *
     * @return the error path
     */
    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }
}
