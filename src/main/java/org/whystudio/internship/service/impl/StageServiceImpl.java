package org.whystudio.internship.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.whystudio.internship.dto.StageDto;
import org.whystudio.internship.entity.Stage;
import org.whystudio.internship.entity.Student;
import org.whystudio.internship.exception.RRException;
import org.whystudio.internship.mapper.StageMapper;
import org.whystudio.internship.service.IStageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.service.IStudentService;

/**
 * <p>
 * 状态控制表,当前填写第几阶段，实习报告册1和鉴定表0，分别为三个阶段。报告册：学生填写阶段1，学生填写阶段2，教师评定阶段。鉴定表：学生实习总结，学生实习陈述，教师总结评定。 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class StageServiceImpl extends ServiceImpl<StageMapper, Stage> implements IStageService {

    @Autowired
    IStudentService studentService;

    @Override
    public StageDto getCollegeStage(String stuno) {
        String collegeCode = studentService.lambdaQuery().eq(Student::getStuno, stuno).one().getCollegecode();
        if (StringUtils.isBlank(collegeCode)) {
            throw new RRException("college not found");
        }
        StageDto stageDto = new StageDto();
        Stage report = this.lambdaQuery().eq(Stage::getCollegecode, collegeCode).eq(Stage::getIsreport, true).orderByDesc(Stage::getCreated).last("limit 1").one();
        if (report != null) {
            stageDto.setReportStage(report.getStage());
        }
        Stage appraisal = this.lambdaQuery().eq(Stage::getCollegecode, collegeCode).eq(Stage::getIsreport, false).orderByDesc(Stage::getCreated).last("limit 1").one();
        if (appraisal != null) {
            stageDto.setAppraisalStage(appraisal.getStage());
        }
        return stageDto;
    }
}
