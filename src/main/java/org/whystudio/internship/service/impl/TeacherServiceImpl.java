package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.beans.factory.annotation.Autowired;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Student;
import org.whystudio.internship.entity.Teacher;
import org.whystudio.internship.mapper.StudentMapper;
import org.whystudio.internship.mapper.TeacherMapper;
import org.whystudio.internship.service.ITeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.vo.Const;
import org.whystudio.internship.vo.JsonResult;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 校内导师信息 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper, Teacher> implements ITeacherService {

    @Autowired
    TeacherMapper teacherMapper;

    @Autowired
    StudentMapper studentMapper;

    @Override
    public JsonResult getPersonalInfo(String token) {
        //鉴权成功的话, 这里不需要在判断token为空了, 肯定不为空
        String teachNo = JWTTool.findToken(token);
        Teacher teacher = teacherMapper.selectByTeachno(teachNo); // unique teachNo
        if (teacher == null){
            return ControllerUtil.getFalseResultMsgBySelf("没有找到对应教师信息");
        } else if (!teacher.getStatus()){
            return ControllerUtil.getFalseResultMsgBySelf("该教师已被锁定");
        } else {
            // teacher.setPassword(null); //添加了@JsonIgnore
            return ControllerUtil.getSuccessResultBySelf(teacher);
        }
    }

    @Override
    public JsonResult updatePersonalInfo(String token, Teacher teacher) {
        String teachNo = JWTTool.findToken(token); // not null
        teacher.setTeachno(teachNo);
        LambdaUpdateWrapper<Teacher> lambdaUpdateWrapper = Wrappers.lambdaUpdate();
        lambdaUpdateWrapper.eq(Teacher::getTeachno, teachNo);
        if (teacherMapper.update(teacher, lambdaUpdateWrapper) > 0){
            return ControllerUtil.getDataResult(teacherMapper.selectByTeachno(teachNo));
        } else {
            return ControllerUtil.getFalseResultMsgBySelf("更新信息失败");
        }
    }

    @Override
    public JsonResult getMyStudents(String token) {
        String teachNo = JWTTool.findToken(token); // not null
        List<Map<String, Object>> students = studentMapper.listTeachersStudentWithReportStatusAndAppraisalStatus(teachNo);
        // 已经对Student密码区域增加了@JsonIgnore
        return ControllerUtil.getDataResult(students);
    }

}
