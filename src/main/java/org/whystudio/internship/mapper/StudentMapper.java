package org.whystudio.internship.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
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
    @Select("select student.*,case when CHARACTER_LENGTH(report.stage1_summary)>0 then 1 else 0 end as reportStage1Summary,\n" +
            "case when CHARACTER_LENGTH(report.stage2_summary)>0 then 1 else 0 end as reportStage2Summary,\n" +
            "case when CHARACTER_LENGTH(appraisal.content)>0 then 1 else 0 end as appraisalContent, \n" +
            "case when CHARACTER_LENGTH(appraisal.summary)>0 then 1 else 0 end as appraisalSummary \n" +
            "from student \n" +
            "LEFT JOIN report ON student.stuno=report.stuno \n" +
            "LEFT JOIN appraisal ON student.stuno=appraisal.stuno \n" +
            "where student.teachno=${teachNo}")
    List<Map<String, Object>> listTeachersStudentWithReportStatusAndAppraisalStatus(@Param("teachNo") String teachNo);
}
