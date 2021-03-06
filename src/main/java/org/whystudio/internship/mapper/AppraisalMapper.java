package org.whystudio.internship.mapper;

import org.apache.ibatis.annotations.Param;

import org.springframework.stereotype.Repository;
import org.whystudio.internship.entity.Appraisal;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.whystudio.internship.entity.Student;

/**
 * <p>
 * 实习鉴定表 Mapper 接口
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Repository
public interface AppraisalMapper extends BaseMapper<Appraisal> {
    int updateStudentContentByStuno(@Param("appraisal") Appraisal appraisal);
}
