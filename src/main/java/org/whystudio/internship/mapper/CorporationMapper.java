package org.whystudio.internship.mapper;

import org.springframework.stereotype.Repository;
import org.whystudio.internship.entity.Corporation;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 实习企业信息表
 Mapper 接口
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Repository
public interface CorporationMapper extends BaseMapper<Corporation> {

}
