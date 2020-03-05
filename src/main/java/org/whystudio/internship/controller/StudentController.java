package org.whystudio.internship.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.whystudio.internship.entity.*;
import org.whystudio.internship.service.IStudentService;
import org.whystudio.internship.vo.JsonResult;

/**
 * 学生相关操作控制器
 */
@RestController
@RequestMapping("/student")
public class StudentController extends BaseController {

    @Autowired
    IStudentService studentService;

    @GetMapping("/info")
    @ApiOperation(value = "查询个人信息", notes = "将实习开始结束时间、职位、公司等信息放到个人信息中了,返回时去除密码等敏感字段")
    @Deprecated
    public JsonResult personalInfo(@RequestHeader String token){
        return null;
    }

    @PostMapping("/info")
    @ApiOperation(value = "修改个人信息", notes = "传入需要更新的字段即可, 非空字段进行修改,且注意某些特殊字段不能修改,且注意有的字段比如时间需要后台设置值")
    @Deprecated
    public JsonResult modifyPersonalInfo(@RequestHeader String token, Student student){
        return null;
    }

    @GetMapping("/corp")
    @ApiOperation(value = "查询绑定的企业信息", notes = "若没有则在数据库生成一条空记录(有学号的),并返回")
    @Deprecated
    public JsonResult corporationInfo(@RequestHeader String token){
        return null;
    }

    @PostMapping("/corp")
    @ApiOperation(value = "修改绑定的企业信息", notes = "传入非空字段进行修改,且注意某些特殊字段不能修改,且注意有的字段比如时间需要后台设置值")
    @Deprecated
    public JsonResult modifyCorporationInfo(@RequestHeader String token, Corporation corporation){
        return null;
    }

    @GetMapping("/report")
    @ApiOperation(value = "查询实习报告册信息", notes = "如果数据库没有该用户的report则生成一条空记录插入并返回, " +
            "由于report中date字段太多,现已单独分离出来, 单独填写,返回reportInfo时将reportDateInfo一起返回")
    @Deprecated
    public JsonResult reportInfo(@RequestHeader String token){
        return null;
    }

    @PostMapping("/report/stage1")
    @ApiOperation(value = "报告表第一阶段", notes = "传整个report, 但是后台只取阶段1的内容和其它必要内容更新到数据库,阶段2填了也不更新, 填写时间后台生成, 前台不传")
    @Deprecated
    public JsonResult reportStage1(@RequestHeader String token, Report report){
        return null;
    }

    @PostMapping("/report/stage2")
    @ApiOperation(value = "报告表第二阶段", notes = "传整个report, 但是后台只取阶段2的内容和其它必要内容更新到数据库,阶段1填了也不更新, 填写时间后台生成, 前台不传")
    @Deprecated
    public JsonResult reportStage2(@RequestHeader String token, Report report){
        return null;
    }
    @PostMapping("/report/date")
    @ApiOperation(value = "报告表时间填写", notes = "传相关时间进来即可, 学生只能手动填写stage1_duration和stage2_duration这两个时间[段]字段,其余都是自动生成")
    @Deprecated
    public JsonResult mofifyReportDate(@RequestHeader String token, Reportdate reportdate){
        return null;
    }

    @GetMapping("/appraisal")
    @ApiOperation(value = "查询实习鉴定表信息", notes = "如果数据库没有该用户的appraisal则生成一条空记录插入并返回, " +
            "由于appraisal中date字段太多,现已单独分离出来, 单独填写,返回appraisalInfo时将appraisalDateInfo一起返回")
    @Deprecated
    public JsonResult appraisalInfo(@RequestHeader String token){
        return null;
    }

    @PostMapping("/appraisal")
    @ApiOperation(value = "更新或者保存鉴定表信息", notes = "传入appraisal, 更新相关信息,学生只能更新学生相关字段, 请注意")
    @Deprecated
    public JsonResult modifyAppraisalInfo(@RequestHeader String token, Appraisal appraisal){
        return null;
    }

    @PostMapping("/appraisal/date")
    @ApiOperation(value = "鉴定表时间填写", notes = "学生无法使用此接口, 因为其中的时间都是后台自动生成的")
    @Deprecated //该接口不用实现, 永久废弃.
    public JsonResult mofifyAppraisalDate(@RequestHeader String token, Reportdate reportdate){
        return null;
    }

    // 下载报告册和鉴定表在fileController中
}
