package org.whystudio.internship.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.whystudio.internship.annotation.Auth;
import org.whystudio.internship.service.IPdfService;
import org.whystudio.internship.vo.Const;
import org.whystudio.internship.vo.JsonResult;

import java.util.List;

/**
 * pdf文件操作控制器
 * 除了数据库pdf信息操作之外
 * 还有pdf文件生成等服务。
 */
@RestController
@CrossOrigin
@RequestMapping("pdf")
public class PdfController extends BaseController {

    @Autowired
    IPdfService pdfService;

    @ApiOperation(value = "增加转换任务")
    @PostMapping("convert")
    @Auth(role = Const.AUTH_STUDENT)
    public JsonResult convertTask(String token, Boolean report) {
        if (report) {
            return pdfService.executeConvertReportTask(token);
        } else {
            return pdfService.executeConvertAppraisalTask(token);
        }
    }


    @ApiOperation(value = "获取我的转换过的文件, desc排序, 不传就是获取全部, true为report, false 为appraisal")
    @GetMapping("")
    @Auth(role = Const.AUTH_STUDENT)
    public JsonResult allMyPdf(@RequestHeader String token,
                               @RequestParam(required = false) Boolean report) {
        return pdfService.allMyPdf(token, report);
    }

    @ApiOperation(value = "删除pdf, 支持批量删除, 传id数组")
    @DeleteMapping("")
    @Auth(role = Const.AUTH_STUDENT)
    public JsonResult deletePdf(@RequestHeader String token,
                                @RequestBody List<Long> pdfIds) {
        return pdfService.deleteByIds(token, pdfIds);
    }
}
