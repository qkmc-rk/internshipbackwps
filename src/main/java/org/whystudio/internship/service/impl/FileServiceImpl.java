package org.whystudio.internship.service.impl;

import org.whystudio.internship.entity.File;
import org.whystudio.internship.mapper.FileMapper;
import org.whystudio.internship.service.IFileService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 文件存储 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class FileServiceImpl extends ServiceImpl<FileMapper, File> implements IFileService {

}
