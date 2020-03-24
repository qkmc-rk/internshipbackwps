package org.whystudio.internship.controller;

import io.swagger.annotations.ApiOperation;
import org.apache.http.auth.AUTH;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.whystudio.internship.annotation.Auth;
import org.whystudio.internship.service.IFileService;
import org.whystudio.internship.vo.Const;
import org.whystudio.internship.vo.JsonResult;

/**
 * 文件上传、下载、查询控制器
 */
@RestController
@RequestMapping("/file")
public class FileController extends BaseController {
    @Autowired
    IFileService fileService;

    @GetMapping("")
    @ApiOperation(value = "列出数据库中存的文件的URL等信息", notes = "文件信息")
    @Auth(role = Const.AUTH_ADMIN)
    public JsonResult listFile(){
        return fileService.getFileList() ;
    }

    @PostMapping("/{id}")
    @ApiOperation(value = "通过id删除文件", notes = "传入文件的Id, 删除七牛云上的文件, 在删除数据库文件记录")
    @Auth(role = Const.AUTH_ADMIN)
    public JsonResult deleteFileById(@PathVariable Integer id){
        return fileService.deleteFileById(id);
    }

    @PostMapping("/url")
    @ApiOperation(value = "通过url删除文件", notes = "传入文件的url, 删除七牛云上的文件, 在删除数据库文件记录")
    @Auth(role = Const.AUTH_ADMIN)
    public JsonResult deleteFileByUrl(@RequestParam String url){
        return fileService.deleteFileByUrl(url);
    }

    @PostMapping("")
    @ApiOperation(value = "上传文件", notes = "上传文件, 获取文件的名称, 后缀, 大小等信息, 文件上传到七牛云之后要将信息保存到数据库,并返回文件信息到前端")
    @Auth(role = Const.AUTH_ALL)
    public JsonResult uploadFile(MultipartFile file){
        return fileService.uploadToQiNiu(file);
    }

    @GetMapping("/report")
    @ApiOperation(value = "下载报告册", notes = "学生下载自己的报告册, 后台生成pdf文件, 传到七牛云后,文件信息存到数据库file中,在返回文件信息给前台")
    @Deprecated
    public JsonResult downloadReport(@RequestHeader String token){
        return null;
    }

    @GetMapping("/appraisal")
    @ApiOperation(value = "下载鉴定表", notes = "学生下载自己的鉴定表, 后台生成pdf文件, 传到七牛云后,文件信息存到数据库file中,在返回文件信息给前台")
    @Deprecated
    public JsonResult downloadAppraisal(@RequestHeader String token){
        return null;
    }

}
