package org.whystudio.internship.service;


import org.whystudio.internship.entity.Student;
import com.baomidou.mybatisplus.extension.service.IService;
import org.whystudio.internship.vo.JsonResult;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 学生信息 服务类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
public interface IStudentService extends IService<Student> {

    /**
     * 返回学生个人相关信息 不包含密码、ID
     *
     * @param token :
     * @return: java.util.List<java.util.Map < java.lang.String, java.lang.Object>>
     */
    JsonResult getPersonalInfo(String token);

    /**
     * 更新学生信息
     *
     * @param token   :
     * @param student :
     * @return: org.whystudio.internship.vo.JsonResult
     */
    JsonResult updatePersonalInfo(String token, Student student);

}
