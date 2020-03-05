package org.whystudio.internship.mapper;

import org.springframework.stereotype.Repository;
import org.whystudio.internship.entity.Stage;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 状态控制表,当前填写第几阶段，实习报告册1和鉴定表0，分别为三个阶段。报告册：学生填写阶段1，学生填写阶段2，教师评定阶段。鉴定表：学生实习总结，学生实习陈述，教师总结评定。 Mapper 接口
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Repository
public interface StageMapper extends BaseMapper<Stage> {

}
