package org.whystudio.internship.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.whystudio.internship.entity.Teacher;
import org.whystudio.internship.vo.JsonResult;

@RestController
@RequestMapping("/teacher")
public class TeacherController extends BaseController {

    @GetMapping("/info")
    @ApiOperation(value = "查询个人信息", notes = "查询教师的个人信息,若与学生端有重复代码,可通过base抽离")
    @Deprecated
    public JsonResult personalInfo(@RequestHeader String token){
        return null;
    }

    @PostMapping("/info")
    @ApiOperation(value = "修改个人信息", notes = "传入需要更新的字段即可, 非空字段进行修改,且注意某些特殊字段不能修改,且注意有的字段比如时间需要后台设置值")
    @Deprecated
    public JsonResult modifyPersonalInfo(@RequestHeader String token, Teacher teacher){
        return null;
    }

    @GetMapping("/student")
    @ApiOperation(value = "查询所有的我的学生", notes = "返回学生列表,列表中包含学生基础信息,报告册的填写情况和阶段,鉴定表的填写情况和阶段,这个方法适当复杂")
    @Deprecated
    public JsonResult listMyStudent(@RequestHeader String token){
        return null;
    }

    @GetMapping("/student/condition")
    @ApiOperation(value = "查询所有的符合条件的我的学生", notes = "返回学生列表,列表中包含学生基础信息,报告册的填写情况和阶段,鉴定表的填写情况和阶段," +
            "这个方法适当复杂,reportCondition = 0不限制, 1报告册第一阶段完成, 2报告册第二阶段完成," +
            "appraisalCondition = 0不限制(包含未填写完的), 1填写完成")
    @Deprecated
    public JsonResult listMyStudentByCondition(@RequestHeader String token,
                                               @RequestParam Integer reportCondition,
                                               @RequestParam Integer appraisalCondition){
        return null;
    }

    @GetMapping("/student/{stuno}/report")
    @ApiOperation(value = "获取某个学生的报告册", notes = "后台注意校验数据, 要包含时间等信息")
    @Deprecated
    public JsonResult studentReport(@RequestHeader String token,
                                    @PathVariable String stuno){
        return null;
    }

    @PostMapping("/student/{stuno}/report/stage1")
    @ApiOperation(value = "给学生的报告册填写第一阶段评价和打分", notes = "评价和打分")
    @Deprecated
    public JsonResult evalStudentReport1(@RequestHeader String token,
                                        @PathVariable String stuno,
                                        @RequestParam String stage1Comment,
                                        @RequestParam String stage1Grade ){
        return null;
    }

    @PostMapping("/student/{stuno}/report/stage2")
    @ApiOperation(value = "给学生的报告册填写第二阶段评价和打分", notes = "评价和打分,第二阶段评价后,后台要生成综合成绩")
    @Deprecated
    public JsonResult evalStudentReport2(@RequestHeader String token,
                                         @PathVariable String stuno,
                                         @RequestParam String stage2Comment,
                                         @RequestParam String stage2Grade ){
        return null;
    }

    @PostMapping("/student/{stuno}/report/total")
    @ApiOperation(value = "给学生的报告册填写综合评价(没有打分)", notes = "综合评价,注意数据校验和时间填写")
    @Deprecated
    public JsonResult evalStudentReportTotal(@RequestHeader String token,
                                         @PathVariable String stuno,
                                         @RequestParam String total_eval ){
        return null;
    }

    // 以下是鉴定表
    @GetMapping("/student/{stuno}/appraisal")
    @ApiOperation(value = "获取某个学生的鉴定表", notes = "后台注意校验数据,注意带上时间信息")
    @Deprecated
    public JsonResult studentAppraisal(@RequestHeader String token,
                                    @PathVariable String stuno){
        return null;
    }

    @PostMapping("/student/{stuno}/appraisal")
    @ApiOperation(value = "鉴定表教师填写内容", notes = "corpTeacherGrade单位导师成绩, 导师成绩,领导意见, " +
            "后台需要校验当corpTeacherGrade、teacherGrade都存在时,需要生成综合成绩")
    @Deprecated
    public JsonResult evalStudentAppraisal(@RequestHeader String token,
                                           @PathVariable String stuno,
                                           @RequestParam(required = false) String corpTeacherGrade,
                                           @RequestParam(required = false) String teacherGrade,
                                           @RequestParam(required = false) String leaderOpinion){
        return null;
    }


}
