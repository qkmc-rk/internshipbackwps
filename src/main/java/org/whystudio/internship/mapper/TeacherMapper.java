package org.whystudio.internship.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.whystudio.internship.entity.Teacher;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

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

    /**
     * 使用wrapper自定义查询条件... 没啥意思,这个方法比较鸡肋
     * @param wrapper
     * @return
     */
    @Select("select * from teacher ${ew.customSqlSegment}")
    List<Teacher> selectTeacherByModifySql(@Param(Constants.WRAPPER) Wrapper<Teacher> wrapper);

}
