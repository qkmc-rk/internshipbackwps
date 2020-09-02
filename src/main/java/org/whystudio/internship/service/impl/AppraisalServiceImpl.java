package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.*;
import org.whystudio.internship.entity.Appraisal;
import org.whystudio.internship.mapper.AppraisalMapper;
import org.whystudio.internship.mapper.AppraisaldateMapper;
import org.whystudio.internship.mapper.StudentMapper;
import org.whystudio.internship.mapper.TeacherMapper;
import org.whystudio.internship.service.IAppraisalService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.service.IAppraisaldateService;
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

    @Autowired
    TeacherMapper teacherMapper;
    @Autowired
    AppraisaldateMapper appraisaldateMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public JsonResult getAppraisalInfo(String token) {
        String stuno = JWTTool.findToken(token);
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

    @Override
    @Transactional(rollbackFor = Exception.class)
    public JsonResult updateAppraisalInfo(String token, Appraisal appraisal) {
        String stuno = JWTTool.findToken(token);
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

    @Override
    @Transactional
    public Map<String, String> getAppraisalInfoInJodFormatByStuno(String stuno) {
        LambdaQueryWrapper<Appraisal> lambdaQueryWrapper = Wrappers.lambdaQuery();
        List<Appraisal> appraisalList = appraisalMapper.selectList(lambdaQueryWrapper.eq(Appraisal::getStuno, stuno).select());
        if (appraisalList == null || appraisalList.size() < 1) {
            Appraisal appraisal = new Appraisal();
            Appraisaldate appraisaldate = new Appraisaldate();
            appraisal.setStuno(stuno);
            appraisaldate.setStuno(stuno);
            appraisalMapper.insert(appraisal);
            appraisaldateMapper.insert(appraisaldate);
            appraisalList = new ArrayList<>();
            appraisalList.add(appraisal);
        }
        Appraisal appraisal = appraisalList.get(0);
        LambdaQueryWrapper<Appraisaldate> lambdaQueryWrapper1 = Wrappers.lambdaQuery();
        Appraisaldate appraisaldate = appraisaldateService.getOne(lambdaQueryWrapper1.eq(Appraisaldate::getStuno, stuno));
        // 如果默认没有时间填写, 则默认使用当前时间
        if (appraisaldate == null) {
            appraisaldate = new Appraisaldate();
        }
        Map<String, String> params = new HashMap<>(32);
        Student student = studentMapper.selectByStuno(stuno);
        params.put("${college}", student.getCollege());
        params.put("${major}", student.getMajor());
        params.put("${name}", student.getName());
        params.put("${stuno}", student.getStuno());
        params.put("${corp_name}", student.getCorp());
        params.put("${start}", student.getStarttime() == null ? "" : student.getStarttime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        params.put("${end}", student.getEndtime() == null ? "" : student.getEndtime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        params.put("${content}", appraisal.getContent());
        params.put("${summary}", appraisal.getSummary());
        params.put("${corp_teacher_opinion}", appraisal.getCorpTeacherOpinion());
        params.put("${corp_opinion}", appraisal.getCorpOpinion());
        params.put("${teacher_grade}", appraisal.getTeacherGrade());
        // 填写的时候就有
        params.put("${synthgrade}", appraisal.getSynthGrade());
        params.put("${college_principal_opinion}", appraisal.getLeaderOpinion());
        params.put("${corp_teacher_grade}", appraisal.getCorpTeacherGrade());
        return params;
    }
}
