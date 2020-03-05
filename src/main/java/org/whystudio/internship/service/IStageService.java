package org.whystudio.internship.service;

import org.whystudio.internship.entity.Stage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 状态控制表,当前填写第几阶段，实习报告册1和鉴定表0，分别为三个阶段。报告册：学生填写阶段1，学生填写阶段2，教师评定阶段。鉴定表：学生实习总结，学生实习陈述，教师总结评定。 服务类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
public interface IStageService extends IService<Stage> {

}
