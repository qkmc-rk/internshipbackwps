package org.whystudio.internship.service;

import org.springframework.web.multipart.MultipartFile;
import org.whystudio.internship.entity.File;
import com.baomidou.mybatisplus.extension.service.IService;
import org.whystudio.internship.vo.JsonResult;

/**
 * <p>
 * 文件存储 服务类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
public interface IFileService extends IService<File> {

    /**
     * 上传文件
     * @param file
     * @return
     */
    JsonResult uploadToQiNiu(MultipartFile file);

    /**
     * 删除文件
     * @param id
     * @return
     */
    JsonResult deleteFileById(Integer id);

    /**
     * 删除文件
     * @param url
     * @return
     */
    JsonResult deleteFileByUrl(String url);

    /**
     * 获取File列表
     * @return
     */
    JsonResult getFileList();
}
