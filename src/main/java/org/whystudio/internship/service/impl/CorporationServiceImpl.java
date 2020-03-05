package org.whystudio.internship.service.impl;

import org.whystudio.internship.entity.Corporation;
import org.whystudio.internship.mapper.CorporationMapper;
import org.whystudio.internship.service.ICorporationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 实习企业信息表
 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class CorporationServiceImpl extends ServiceImpl<CorporationMapper, Corporation> implements ICorporationService {

}
