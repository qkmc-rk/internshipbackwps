package org.whystudio.internship.service;

import org.whystudio.internship.entity.Teacher;
import com.baomidou.mybatisplus.extension.service.IService;
import org.whystudio.internship.vo.JsonResult;

/**
 * <p>
 * 校内导师信息 服务类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
public interface ITeacherService extends IService<Teacher> {

    /**
     * 获取教师个人信息
     * @param token 教师token
     * @return 教师个人信息的JsonResult对象
     */
    JsonResult getPersonalInfo(String token);

    /**
     * 更新教师个人信息
     * @param token 令牌
     * @param teacher 教师的可选信息
     * @return
     */
    JsonResult updatePersonalInfo(String token, Teacher teacher);

    /**
     * 获取教师的所有学生信息
     * 此处使用wrapper更为合适
     * @param token
     * @return
     */
    JsonResult getMyStudents(String token);

    /**
     * 获取我的某个学生的报告册
     * @param token
     * @param stuno 某个学生的学号
     * @return 学生的报告册信息 其中包含学生的基本信息
     */
    JsonResult myStudentReport(String token, String stuno);

    /**
     * 获取我的某个学生的鉴定表
     * @param token
     * @param stuno 某个学生的学号
     * @return 学生的鉴定表信息 其中包含学生的基本信息
     */
    JsonResult myStudentAppraisal(String token, String stuno);

    /**
     *  教师对学生的鉴定表进行评分操作
     * @param token
     * @param stuno
     * @param corpTeacherGrade
     * @param teacherGrade
     * @param leaderOpinion
     * @return
     */
    JsonResult evalStudentAppraisal(String token, String stuno, String corpTeacherGrade, String teacherGrade, String leaderOpinion);

    /**
     * 给学生报告册第一阶段评价和打分
     * @param token
     * @param stuno
     * @param stage1Comment
     * @param stage1Grade
     * @return
     */
    JsonResult evalStudentReport1(String token, String stuno, String stage1Comment, String stage1Grade);

    /**
     * 给学生报告册第二阶段评价和打分
     * @param token
     * @param stuno
     * @param stage2Comment
     * @param stage2Grade
     * @return
     */
    JsonResult evalStudentReport2(String token, String stuno, String stage2Comment, String stage2Grade);

    /**
     * 总评价
     * @param token
     * @param stuno
     * @param total_eval
     * @return
     */
    JsonResult evalStudentReportTotal(String token, String stuno, String total_eval);
}
