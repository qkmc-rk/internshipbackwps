package org.whystudio.internship.service.impl;

import org.whystudio.internship.entity.Teacher;
import org.whystudio.internship.mapper.TeacherMapper;
import org.whystudio.internship.service.ITeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 校内导师信息 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper, Teacher> implements ITeacherService {

}
