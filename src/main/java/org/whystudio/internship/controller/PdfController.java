package org.whystudio.internship.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.whystudio.internship.service.IPdfService;
import org.whystudio.internship.vo.JsonResult;

/**
 *
 * pdf文件操作控制器
 * 除了数据库pdf信息操作之外
 * 还有pdf文件生成等服务。
 *
 */
@RestController
@RequestMapping("pdf")
public class PdfController extends BaseController {

    @Autowired
    IPdfService pdfService;

    @PostMapping("convert")
    public JsonResult convertTask(String token){
        return pdfService.executeConvertReportTask(token);
    }

}
