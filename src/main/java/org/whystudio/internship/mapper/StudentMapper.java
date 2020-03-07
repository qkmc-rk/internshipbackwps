package org.whystudio.internship.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;
import org.whystudio.internship.entity.Student;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

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
     * 通过学号查询去除密码和ID的学生信息
     *
     * @param stuno :
     * @return: java.util.List<java.util.Map < java.lang.String, java.lang.Object>>
     */
    Map<String, Object> selectPersonalInfoByStuno(@Param("stuno") String stuno);

}
