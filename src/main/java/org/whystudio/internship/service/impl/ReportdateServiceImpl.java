package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.conditions.update.LambdaUpdateChainWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Reportdate;
import org.whystudio.internship.mapper.ReportdateMapper;
import org.whystudio.internship.service.IReportdateService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.vo.JsonResult;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class ReportdateServiceImpl extends ServiceImpl<ReportdateMapper, Reportdate> implements IReportdateService {

    @Autowired
    IReportdateService reportdateService;

    @Override
    public JsonResult updateReportDate(String token, Reportdate reportdate) {
        String stuno = JWTTool.findToken(token);
        if (StringUtils.isNotBlank(stuno)) {
            // 先判断数据库是否存在，不存在要新建
            List<Reportdate> list = reportdateService.lambdaQuery().eq(Reportdate::getStuno, stuno).list();
            if (null == list || list.size() < 1){
                Reportdate r = new Reportdate();
                r.setStuno(stuno);
                reportdateService.save(r);
            }
            String stage1Duration = reportdate.getStage1Duration();
            String stage2Duration = reportdate.getStage2Duration();
            boolean stage1IsNotBlack = StringUtils.isNotBlank(stage1Duration);
            boolean stage2IsNotBlack = StringUtils.isNotBlank(stage2Duration);
            if (stage1IsNotBlack || stage2IsNotBlack) {
                LambdaUpdateChainWrapper<Reportdate> reportdateWrapper = this.lambdaUpdate();
                if (stage1IsNotBlack) {
                    reportdateWrapper.set(Reportdate::getStage1Duration, stage1Duration);
                }
                if (stage2IsNotBlack) {
                    reportdateWrapper.set(Reportdate::getStage2Duration, stage2Duration);
                }
                boolean updateStatus = reportdateWrapper.eq(Reportdate::getStuno, stuno).update();
                if (updateStatus) {
                    return ControllerUtil.getSuccessResultBySelf("更新成功");
                } else {
                    return ControllerUtil.getFalseResultMsgBySelf("更新失败，记录不存在");
                }
            } else {
                return ControllerUtil.getFalseResultMsgBySelf("stage1Duration、stage2Duration至少提交一个");
            }
        }
        return ControllerUtil.getFalseResultMsgBySelf("无效的Token");
    }
}
