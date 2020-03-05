package org.whystudio.internship.mapper;

import org.springframework.stereotype.Repository;
import org.whystudio.internship.entity.Notification;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 实习单位发布通知
 Mapper 接口
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Repository
public interface NotificationMapper extends BaseMapper<Notification> {

}
