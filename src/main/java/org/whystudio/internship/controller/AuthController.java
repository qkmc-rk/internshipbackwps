package org.whystudio.internship.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.whystudio.internship.service.IUserService;
import org.whystudio.internship.util.IpTool;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.util.VerifyCodeTool;
import org.whystudio.internship.util.VerifyImgGenerator;
import org.whystudio.internship.vo.Const;
import org.whystudio.internship.vo.JsonResult;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

/**
 *
 * 认证控制器
 *
 */
@RestController
@RequestMapping("/auth")
public class AuthController extends BaseController{

    @Autowired
    IUserService userService;

    /**
     * 用于前端查询状态码, 方便前后端对接
     * @return
     */
    @GetMapping("/status")
    @ApiOperation(value = "状态码表", notes = "用于前端查询状态码，方便前后台对接")
    public JsonResult statusTable(){
        return ControllerUtil.customResult(Const.OPERATION_SUCCESS,"SUCCESS",new Const());
    }

    @ApiOperation("验证码")
    @GetMapping("/verifycode")
    public void getCode(HttpServletRequest request, HttpServletResponse response){
        verifyCodeGenerate(request, response);
    }

    @GetMapping("/token/expire")
    @ApiOperation(value = "判断token是否过期了")
    public JsonResult tokenExpire(@RequestHeader String token){
        String username = JWTTool.findToken(token);
        return ControllerUtil.getTrueOrFalseResult(!(null == username));
    }

    @PostMapping("/token")
    @ApiOperation(value = "登录接口", notes = "传入用户名密码")
    public JsonResult login(@RequestParam String username,
                            @RequestParam String password,
                            @RequestParam(required = false) String verifyCode,
                            HttpServletRequest request,
                            String type){
        String ip = IpTool.getIpAddr(request);
        //校验密码
        return userService.login(type, username, password, verifyCode, ip);
    }

    @PostMapping("/password")
    @ApiOperation(value = "找回密码接口", notes = "传入身份证, 账号, 新密码, 以及type(student,teacher)返回找回密码成功与否")
    @Deprecated
    public JsonResult findPassword(){
        return null;
    }

    // ----- private methods ------ //
    private void verifyCodeGenerate(HttpServletRequest request, HttpServletResponse response){
        //利用图片工具生成图片
        //第一个参数是生成的验证码，第二个参数是生成的图片
        Object[] objs = VerifyImgGenerator.createImage();
        //将验证码存入验证码池
        VerifyCodeTool.setVerifyCodeToRedis(IpTool.getIpAddr(request), objs[0].toString().toLowerCase());
        //将图片输出给浏览器
        BufferedImage image = (BufferedImage) objs[1];
        response.setContentType("image/png");
        OutputStream os;
        try {
            os = response.getOutputStream();
            ImageIO.write(image, "png", os);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
