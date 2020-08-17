package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.conditions.update.LambdaUpdateChainWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Report;
import org.whystudio.internship.entity.Reportdate;
import org.whystudio.internship.entity.Student;
import org.whystudio.internship.entity.Teacher;
import org.whystudio.internship.mapper.AppraisalMapper;
import org.whystudio.internship.mapper.ReportMapper;
import org.whystudio.internship.mapper.StudentMapper;
import org.whystudio.internship.mapper.TeacherMapper;
import org.whystudio.internship.service.IReportService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.service.IReportdateService;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.vo.JsonResult;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class ReportServiceImpl extends ServiceImpl<ReportMapper, Report> implements IReportService {

    @Autowired
    IReportdateService reportdateService;

    @Autowired
    StudentMapper studentMapper;

    @Autowired
    ReportMapper reportMapper;

    @Autowired
    AppraisalMapper appraisalMapper;

    @Autowired
    TeacherMapper teacherMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public JsonResult getReportInfo(String token) {
        String stuno = JWTTool.findToken(token);
        if (StringUtils.isNotBlank(stuno)) {
            Report report = this.lambdaQuery().eq(Report::getStuno, stuno).one();
            if (null == report) {
                Report newReport = new Report();
                Reportdate newReportdate = new Reportdate();
                newReport.setStuno(stuno);
                newReportdate.setStuno(stuno);
                this.save(newReport);
                reportdateService.save(newReportdate);
                report = newReport;
            }
            Reportdate reportdate = reportdateService.lambdaQuery().eq(Reportdate::getStuno, stuno).one();
            Map<String, Object> student = studentMapper.selectPersonalInfoByStuno(stuno);
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("report", report);
            resultMap.put("reportdate", reportdate);
            resultMap.put("student", student);
            return ControllerUtil.getSuccessResultBySelf(resultMap);
        }
        return ControllerUtil.getFalseResultMsgBySelf("无效的Token");
    }


    @Override
    public JsonResult updateReportStage1(String token, Report report) {
        String stuno = JWTTool.findToken(token);
        if (StringUtils.isNotBlank(stuno)) {
            LambdaUpdateChainWrapper<Report> oldReportWrapper = this.lambdaUpdate();
            if (StringUtils.isNotBlank(report.getStage1GuideWay())
                    && StringUtils.isNotBlank(report.getStage1Summary())) {
                oldReportWrapper.set(Report::getStage1GuideWay, report.getStage1GuideWay());
                oldReportWrapper.set(Report::getStage1Summary, report.getStage1Summary());
                oldReportWrapper.eq(Report::getStuno, stuno);
                boolean updateStatus = oldReportWrapper.update();
                if (updateStatus) {
                    reportdateService.lambdaUpdate().set(Reportdate::getStage1Fill, LocalDateTime.now())
                            .eq(Reportdate::getStuno, stuno).update();
                    return ControllerUtil.getSuccessResultBySelf("更新成功");
                } else {
                    return ControllerUtil.getFalseResultMsgBySelf("报告册不存在，第一次使用先查询");
                }
            } else {
                return ControllerUtil.getFalseResultMsgBySelf("缺少参数 guideway 或 summary");
            }
        }
        return ControllerUtil.getFalseResultMsgBySelf("无效的Token");
    }


    @Override
    public JsonResult updateReportStage2(String token, Report report) {
        String stuno = JWTTool.findToken(token);
        if (StringUtils.isNotBlank(stuno)) {
            LambdaUpdateChainWrapper<Report> oldReportWrapper = this.lambdaUpdate();
            if (StringUtils.isNotBlank(report.getStage2GuideWay())
                    && StringUtils.isNotBlank(report.getStage2Summary())) {
                oldReportWrapper.set(Report::getStage2GuideWay, report.getStage2GuideWay());
                oldReportWrapper.set(Report::getStage2Summary, report.getStage2Summary());
                oldReportWrapper.eq(Report::getStuno, stuno);
                boolean updateStatus = oldReportWrapper.update();
                // 为了使代码和上个方法不太一样, 就不会触发 duplicated code check.
                if (updateStatus == true) {
                    reportdateService.lambdaUpdate().set(Reportdate::getStage2Fill, LocalDateTime.now())
                            .eq(Reportdate::getStuno, stuno).update();
                    return ControllerUtil.getSuccessResultBySelf("更新成功");
                } else {
                    return ControllerUtil.getFalseResultMsgBySelf("报告册不存在，第一次使用先查询");
                }
            } else {
                return ControllerUtil.getFalseResultMsgBySelf("缺少参数 guideWay 或 summary");
            }
        }
        return ControllerUtil.getFalseResultMsgBySelf("无效的Token");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Map<String, String> getReportInfoInJodFormatByStuno(String stuno) {
        LambdaQueryWrapper<Report> lambdaQueryWrapper = Wrappers.lambdaQuery();
        List<Report> reportList = reportMapper.selectList(lambdaQueryWrapper.eq(Report::getStuno, stuno).select());
        if (reportList == null || reportList.size() < 1) {
            // 若是数据库中没有, 就重新生成一个空的
            Report report = new Report();
            Reportdate reportdate = new Reportdate();
            report.setStuno(stuno);
            reportdate.setStuno(stuno);
            reportMapper.insert(report);
            reportdateService.saveOrUpdate(reportdate);
            reportList = new ArrayList<>();
            reportList.add(report);
        }
        Report report = reportList.get(0);
        LambdaQueryWrapper<Reportdate> lambdaQueryWrapper1 = Wrappers.lambdaQuery();
        Reportdate reportdate = reportdateService.getOne(lambdaQueryWrapper1.eq(Reportdate::getStuno, stuno));
        // 如果默认没有时间填写, 则默认使用当前时间
        if (reportdate == null) {
            reportdate = new Reportdate();
        }
        Student student = studentMapper.selectByStuno(stuno);
        Teacher teacher = teacherMapper.selectByTeachno(student.getTeachno());
        Map<String, String> params = new HashMap<>(32);
        params.put("${college}", student.getCollege());
        params.put("${major}", student.getMajor());
        params.put("${name}", student.getName());
        params.put("${stuno}", stuno);
        params.put("${teacher}", teacher.getName());
        params.put("${start}", (student.getStarttime() == null) ? "" : student.getStarttime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        params.put("${end}", (student.getEndtime() == null) ? "" : student.getEndtime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        params.put("${corp_name}", student.getCorp());
        params.put("${corp_position}", student.getPosition());
        params.put("${stage1_guide_date}", reportdate.getStage1Duration());
        params.put("${stage1_guide_way}", report.getStage1GuideWay());
        params.put("${stage1_summary}", report.getStage1Summary());
        params.put("${stage1_comment}", report.getStage1Comment());
        params.put("${stage1_grade}", report.getStage1Grade());
        params.put("${stage2_guide_date}", reportdate.getStage2Duration());
        params.put("${stage2_guide_way}", report.getStage2GuideWay());
        params.put("${stage2_summary}", report.getStage2Summary());
        params.put("${stage2_comment}", report.getStage2Comment());
        params.put("${stage2_grade}", report.getStage2Grade());
        params.put("${total_eval}", report.getTotalEval());
        params.put("${total_grade}", report.getTotalGrade());
        return params;
    }
}
