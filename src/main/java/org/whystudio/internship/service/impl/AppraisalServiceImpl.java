package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Appraisal;
import org.whystudio.internship.entity.Appraisal;
import org.whystudio.internship.entity.Appraisaldate;
import org.whystudio.internship.mapper.AppraisalMapper;
import org.whystudio.internship.mapper.StudentMapper;
import org.whystudio.internship.service.IAppraisalService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.service.IAppraisaldateService;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.vo.JsonResult;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 实习鉴定表 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class AppraisalServiceImpl extends ServiceImpl<AppraisalMapper, Appraisal> implements IAppraisalService {

    @Autowired
    IAppraisaldateService appraisaldateService;

    @Autowired
    AppraisalMapper appraisalMapper;

    @Autowired
    StudentMapper studentMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public JsonResult getAppraisalInfo(String token) {
        String stuno = JWTTool.findToken(token);
        if (StringUtils.isNotBlank(stuno)) {
            Appraisal appraisal = this.lambdaQuery().eq(Appraisal::getStuno, stuno).one();
            if (null == appraisal) {
                Appraisal newAppraisal = new Appraisal();
                Appraisaldate newAppraisaldate = new Appraisaldate();
                newAppraisal.setStuno(stuno);
                newAppraisaldate.setStuno(stuno);
                this.save(newAppraisal);
                appraisaldateService.save(newAppraisaldate);
                appraisal = newAppraisal;
            }
            Appraisaldate appraisaldate = appraisaldateService.lambdaQuery().eq(Appraisaldate::getStuno, stuno).one();
            Map<String, Object> student = studentMapper.selectPersonalInfoByStuno(stuno);
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("appraisal", appraisal);
            resultMap.put("appraisaldate", appraisaldate);
            resultMap.put("student", student);
            return ControllerUtil.getSuccessResultBySelf(resultMap);
        }
        return ControllerUtil.getFalseResultMsgBySelf("无效的Token");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public JsonResult updateAppraisalInfo(String token, Appraisal appraisal) {
        String stuno = JWTTool.findToken(token);
        if (StringUtils.isNotBlank(stuno)) {
            String content = appraisal.getContent();
            String summary = appraisal.getSummary();
            String corpOpinion = appraisal.getCorpOpinion();
            String corpTeacherOpinion = appraisal.getCorpTeacherOpinion();
            if (StringUtils.isNotBlank(content) || StringUtils.isNotBlank(summary) ||
                    StringUtils.isNotBlank(corpOpinion) || StringUtils.isNotBlank(corpTeacherOpinion)) {
                appraisal.setStuno(stuno);
                int flag = appraisalMapper.updateStudentContentByStuno(appraisal);
                if (flag != 0) {
                    return ControllerUtil.getSuccessResultBySelf("更新成功");
                } else {
                    return ControllerUtil.getFalseResultMsgBySelf("更新失败");
                }
            } else {
                return ControllerUtil.getFalseResultMsgBySelf("至少包含一个参数content、summary、corpOpinion、corpTeacherOpinion");
            }
        }
        return ControllerUtil.getFalseResultMsgBySelf("无效的Token");
    }
}
