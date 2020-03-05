package org.whystudio.internship.service.impl;

import org.whystudio.internship.entity.Student;
import org.whystudio.internship.mapper.StudentMapper;
import org.whystudio.internship.service.IStudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 学生信息 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements IStudentService {

}
