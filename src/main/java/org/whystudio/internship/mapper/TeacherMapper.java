package org.whystudio.internship.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.whystudio.internship.entity.Teacher;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 校内导师信息 Mapper 接口
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Repository
public interface TeacherMapper extends BaseMapper<Teacher> {

    /**
     * 通过工号查询一个教师信息
     * @param teachno
     * @return
     */
    @Select("select * from teacher where teachno=${teachno}")
    Teacher selectByTeachno(@Param("teachno") String teachno);
}
