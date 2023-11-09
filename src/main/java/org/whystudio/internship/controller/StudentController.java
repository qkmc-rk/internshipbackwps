package org.whystudio.internship.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.whystudio.internship.annotation.Auth;
import org.whystudio.internship.annotation.StageValidation;
import org.whystudio.internship.entity.*;
import org.whystudio.internship.service.*;
import org.whystudio.internship.util.PropertyEncryptUtil;
import org.whystudio.internship.vo.Const;
import org.whystudio.internship.vo.JsonResult;

import java.io.UnsupportedEncodingException;
import java.util.Date;

/**
 * 学生相关操作控制器
 */
@RestController
@CrossOrigin
@RequestMapping("/student")
public class StudentController extends BaseController {

    @Autowired
    IStudentService studentService;

    @Autowired
    ICorporationService corporationService;

    @Autowired
    IReportService reportService;

    @Autowired
    IReportdateService reportdateService;

    @Autowired
    IAppraisalService appraisalService;

    @Autowired
    IAppraisaldateService appraisaldateService;

    @GetMapping("/info")
    @ApiOperation(value = "查询个人信息", notes = "将实习开始结束时间、职位、公司等信息放到个人信息中了,返回时去除密码等敏感字段")
    @Auth(role = Const.AUTH_STUDENT)
    public JsonResult personalInfo(@RequestHeader(required = false) String token) {
        try {
            String rs= PropertyEncryptUtil.encrypt("miao", 123456L);
//            System.out.println("加密信息：miao,123456");
//            System.out.println("加密后：" + rs);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        return studentService.getPersonalInfo(token);
    }

    @PostMapping("/info")
    @ApiOperation(value = "修改个人信息", notes = "传入需要更新的字段(age,phone,qq,wechat,potision)")
    @Auth(role = Const.AUTH_STUDENT)
    public JsonResult modifyPersonalInfo(@RequestHeader String timestamp, @RequestHeader(required = false) String token, @RequestBody Student student) {
        return studentService.updatePersonalInfo(token, student, timestamp);
    }

    @GetMapping("/corp")
    @ApiOperation(value = "查询绑定的企业信息", notes = "若没有则在数据库生成一条空记录(有学号的),并返回")
    @Auth(role = Const.AUTH_STUDENT)
    public JsonResult corporationInfo(@RequestHeader(required = false) String token) {
        return corporationService.getCorporationInfo(token);
    }

    @PostMapping("/corp")
    @ApiOperation(value = "修改绑定的企业信息", notes = "传入需要修改的字段(除stuno,id,ischecked和时间字段)")
    @Auth(role = Const.AUTH_STUDENT)
    public JsonResult modifyCorporationInfo(@RequestHeader(required = false) String token, Corporation corporation) {
        return corporationService.updateCorporationInfo(token, corporation);
    }

    @GetMapping("/report")
    @ApiOperation(value = "查询实习报告册信息", notes = "如果数据库没有该用户的report则生成一条空记录插入并返回, " +
            "由于report中date字段太多,现已单独分离出来, 单独填写,返回reportInfo时将reportDateInfo一起返回")
    @Auth(role = Const.AUTH_STUDENT)
    @StageValidation(type = Const.STAGE_REPORT, stage = Const.STAGE_ONE)
    public JsonResult reportInfo(@RequestHeader(required = false) String token) {
        return reportService.getReportInfo(token);
    }

    @PostMapping("/report/stage1")
    @ApiOperation(value = "报告表第一阶段", notes = "传stage1Summary、stage1GuideWay 填写时间后台生成, 前台不传")
    @Auth(role = Const.AUTH_STUDENT)
    @StageValidation(type = Const.STAGE_REPORT, stage = Const.STAGE_ONE)
    public JsonResult reportStage1(@RequestHeader(required = false) String token, Report report) {
        return reportService.updateReportStage1(token, report);
    }

    @PostMapping("/report/stage2")
    @ApiOperation(value = "报告表第二阶段", notes = "传stage2Summary、stage2GuideWay 填写时间后台生成, 前台不传")
    @Auth(role = Const.AUTH_STUDENT)
    @StageValidation(type = Const.STAGE_REPORT, stage = Const.STAGE_TWO)
    public JsonResult reportStage2(@RequestHeader(required = false) String token, Report report) {
        return reportService.updateReportStage2(token, report);
    }

    @PostMapping("/report/date")
    @StageValidation(type = Const.STAGE_REPORT, stage = Const.STAGE_ONE)
    @ApiOperation(value = "报告表时间填写", notes = "学生传stage1Duration和stage2Duration这两个时间[段]字段,其余时间都是自动生成")
    @Auth(role = Const.AUTH_STUDENT)
    public JsonResult mofifyReportDate(@RequestHeader(required = false) String token, Reportdate reportdate) {
        return reportdateService.updateReportDate(token, reportdate);
    }

    @GetMapping("/appraisal")
    @ApiOperation(value = "查询实习鉴定表信息", notes = "如果数据库没有该用户的appraisal则生成一条空记录插入并返回, " +
            "由于appraisal中date字段太多,现已单独分离出来, 单独填写,返回appraisalInfo时将appraisalDateInfo一起返回")
    @Auth(role = Const.AUTH_STUDENT)
    @StageValidation(type = Const.STAGE_APPRAISAL, stage = Const.STAGE_ON)
    public JsonResult appraisalInfo(@RequestHeader(required = false) String token) {
        return appraisalService.getAppraisalInfo(token);
    }

    @PostMapping("/appraisal")
    @ApiOperation(value = "更新或者保存鉴定表信息", notes = "传入content、summary、corpOpinion、corpTeacherOpinion" +
            ", 更新相关信息")
    @Auth(role = Const.AUTH_STUDENT)
    @StageValidation(type = Const.STAGE_APPRAISAL, stage = Const.STAGE_ON)
    public JsonResult modifyAppraisalInfo(@RequestHeader(required = false) String token, Appraisal appraisal) {
        return appraisalService.updateAppraisalInfo(token, appraisal);
    }

    @PostMapping("/appraisal/date")
    @StageValidation(type = Const.STAGE_APPRAISAL, stage = Const.STAGE_ON)
    @ApiOperation(value = "鉴定表时间填写", notes = "学生无法使用此接口, 因为其中的时间都是后台自动生成的")
    @Deprecated //该接口不用实现, 永久废弃.
    @Auth(role = Const.AUTH_STUDENT)
    public JsonResult mofifyAppraisalDate(@RequestHeader(required = false) String token, Reportdate reportdate) {
        return null;
    }

    // 下载报告册和鉴定表在fileController中
}
