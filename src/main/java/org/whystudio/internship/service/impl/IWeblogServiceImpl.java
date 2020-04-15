package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.entity.Weblog;
import org.whystudio.internship.mapper.WeblogMapper;
import org.whystudio.internship.service.IWeblogService;

/**
 * <p>
 * 接口日志记录服务
 * </p>
 *
 * @author nadev
 * @since 2020-4-15
 */
@Service
public class IWeblogServiceImpl extends ServiceImpl<WeblogMapper, Weblog> implements IWeblogService {

}
