package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.conditions.update.LambdaUpdateChainWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Report;
import org.whystudio.internship.entity.Reportdate;
import org.whystudio.internship.mapper.ReportMapper;
import org.whystudio.internship.service.IReportService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.service.IReportdateService;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.vo.JsonResult;

import java.time.LocalDateTime;
import java.util.HashMap;
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
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("report", report);
            resultMap.put("reportdate", reportdate);
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
                if (updateStatus) {
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
}
