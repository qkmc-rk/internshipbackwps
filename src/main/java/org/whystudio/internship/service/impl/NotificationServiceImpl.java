package org.whystudio.internship.service.impl;

import org.whystudio.internship.entity.Notification;
import org.whystudio.internship.mapper.NotificationMapper;
import org.whystudio.internship.service.INotificationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 实习单位发布通知
 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class NotificationServiceImpl extends ServiceImpl<NotificationMapper, Notification> implements INotificationService {

}
