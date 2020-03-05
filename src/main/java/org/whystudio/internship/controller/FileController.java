package org.whystudio.internship.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.whystudio.internship.vo.JsonResult;

/**
 * 文件上传、下载、查询控制器
 */
@RestController
@RequestMapping("/file")
public class FileController extends BaseController {

    @GetMapping("")
    @ApiOperation(value = "列出数据库中存的文件的URL等信息", notes = "文件信息")
    @Deprecated
    public JsonResult listFile(){
        return null;
    }

    @PostMapping("/{id}")
    @ApiOperation(value = "通过id删除文件", notes = "传入文件的Id, 删除七牛云上的文件, 在删除数据库文件记录")
    @Deprecated
    public JsonResult deleteFileById(@PathVariable Integer id){
        return null;
    }

    @PostMapping("/url")
    @ApiOperation(value = "通过url删除文件", notes = "传入文件的url, 删除七牛云上的文件, 在删除数据库文件记录")
    @Deprecated
    public JsonResult deleteFileByUrl(@RequestParam String url){
        return null;
    }

    @PostMapping("")
    @ApiOperation(value = "上传文件", notes = "上传文件, 获取文件的名称, 后缀, 大小等信息, 文件上传到七牛云之后要将信息保存到数据库,并返回文件信息到前端")
    @Deprecated
    public JsonResult uploadFile(MultipartFile file){
        return null;
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
