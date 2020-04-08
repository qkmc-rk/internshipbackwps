package org.whystudio.internship.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;
import org.whystudio.internship.entity.Student;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 学生信息 Mapper 接口
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Repository
public interface StudentMapper extends BaseMapper<Student> {

    /**
     * 通过学号查询一个学生信息
     *
     * @param stuno
     * @return
     */
    @Select("select * from student where stuno=${stuno}")
    Student selectByStuno(@Param("stuno") String stuno);

    /**
     * 列出某个老师的学生, 记录中包含report的 stage1 sum, stage2 sum, appraisal content and appraisal sum
     * @param teachNo
     * @return
     */
    @Select("select student.*," +
            "case when CHARACTER_LENGTH(report.stage1_summary)>0 then 1 else 0 end as reportStage1Summary, " +
            "case when CHARACTER_LENGTH(report.stage1_comment)>0 then 1 else 0 end as reportStage1Comment, " +
            "case when CHARACTER_LENGTH(report.stage1_grade)>0 then 1 else 0 end as reportStage1Grade, " +
            "case when CHARACTER_LENGTH(report.stage2_summary)>0 then 1 else 0 end as reportStage2Summary, " +
            "case when CHARACTER_LENGTH(report.stage2_comment)>0 then 1 else 0 end as reportStage2Comment, " +
            "case when CHARACTER_LENGTH(report.stage2_grade)>0 then 1 else 0 end as reportStage2Grade, " +
            "case when CHARACTER_LENGTH(report.total_eval)>0 then 1 else 0 end as reportTotalEval, " +
            "case when CHARACTER_LENGTH(report.total_grade)>0 then 1 else 0 end as reportTotalGrade, " +
            "case when CHARACTER_LENGTH(appraisal.content)>0 then 1 else 0 end as appraisalContent,  " +
            "case when CHARACTER_LENGTH(appraisal.summary)>0 then 1 else 0 end as appraisalSummary,  " +
            "case when CHARACTER_LENGTH(appraisal.corp_teacher_opinion)>0 then 1 else 0 end as corpTeacherOpinion,  " +
            "case when CHARACTER_LENGTH(appraisal.corp_teacher_grade)>0 then 1 else 0 end as corpTeacherGrade,  " +
            "case when CHARACTER_LENGTH(appraisal.corp_opinion)>0 then 1 else 0 end as corpOpinion,  " +
            "case when CHARACTER_LENGTH(appraisal.teacher_grade)>0 then 1 else 0 end as appraisalTeacherGrade,  " +
            "case when CHARACTER_LENGTH(appraisal.leader_opinion)>0 then 1 else 0 end as leaderOpinion  " +
            "from student \n" +
            "LEFT JOIN report ON student.stuno=report.stuno \n" +
            "LEFT JOIN appraisal ON student.stuno=appraisal.stuno \n" +
            "where student.teachno=${teachNo}")
    List<Map<String, Object>> listTeachersStudentWithReportStatusAndAppraisalStatus(@Param("teachNo") String teachNo);

    /** 通过学号查询去除密码和ID的学生信息
     *
     * @param stuno :
     * @return: java.util.List<java.util.Map < java.lang.String, java.lang.Object>>
     */
    Map<String, Object> selectPersonalInfoByStuno(@Param("stuno") String stuno);

    /**
     * 学生修改qq，微信，电话号码，年龄，职位
     *
     * @param student :
     * @return: int
     */
    int updateStudentInfo(@Param("stu") Student student);

}
