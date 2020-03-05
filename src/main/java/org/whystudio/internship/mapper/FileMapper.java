package org.whystudio.internship.mapper;

import org.springframework.stereotype.Repository;
import org.whystudio.internship.entity.File;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 文件存储 Mapper 接口
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Repository
public interface FileMapper extends BaseMapper<File> {

}
