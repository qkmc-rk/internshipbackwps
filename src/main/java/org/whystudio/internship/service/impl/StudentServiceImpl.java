package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.conditions.update.LambdaUpdateChainWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Corporation;
import org.whystudio.internship.entity.Report;
import org.whystudio.internship.entity.Reportdate;
import org.whystudio.internship.entity.Student;
import org.whystudio.internship.mapper.CorporationMapper;
import org.whystudio.internship.mapper.ReportMapper;
import org.whystudio.internship.mapper.ReportdateMapper;
import org.whystudio.internship.mapper.StudentMapper;
import org.whystudio.internship.service.*;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.util.EntityUtil;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.vo.Const;
import org.whystudio.internship.vo.JsonResult;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 学生信息 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements IStudentService {

    @Autowired
    StudentMapper studentMapper;

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

    @Override
    public JsonResult getPersonalInfo(String token) {
        String stuno = JWTTool.findToken(token);
        if (StringUtils.isNotBlank(stuno)) {
            Map<String, Object> resultMap = studentMapper.selectPersonalInfoByStuno(stuno);
            if (resultMap != null && resultMap.size() != 0) {
                return ControllerUtil.getSuccessResultBySelf(resultMap);
            }
        }
        return ControllerUtil.getFalseResultMsgBySelf("无效的Token");
    }


    @Override
    public JsonResult updatePersonalInfo(String token, Student student) {
        String stuno = JWTTool.findToken(token);
        if (StringUtils.isNotBlank(stuno)) {
            Student oldStu = studentMapper.selectByStuno(stuno);
            if (null != oldStu) {
                if (StringUtils.isNotBlank(student.getWechat()) || StringUtils.isNotBlank(student.getQq()) ||
                        null != student.getAge() || StringUtils.isNotBlank(student.getPosition()) ||
                        StringUtils.isNotBlank(student.getPhone())) {
                    student.setStuno(stuno);
                    int flag = studentMapper.updateStudentInfo(student);
                    if (flag > 0) {
                        return ControllerUtil.getSuccessResultBySelf("修改成功");
                    } else {
                        return ControllerUtil.getFalseResultMsgBySelf("修改失败,可能数据不存在");
                    }
                } else {
                    return ControllerUtil.getFalseResultMsgBySelf("必要参数缺失");
                }
            }
        }
        return ControllerUtil.getFalseResultMsgBySelf("无效的Token");
    }


}
