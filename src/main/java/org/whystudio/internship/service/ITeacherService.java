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
}
