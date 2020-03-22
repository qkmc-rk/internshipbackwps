package org.whystudio.internship.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.whystudio.internship.entity.Pdf;
import org.whystudio.internship.vo.JsonResult;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
public interface IPdfService extends IService<Pdf> {

    /**
     * 添加转换pdf的任务到后台队列
     * @param token
     * @return
     */
    JsonResult executeConvertReportTask(String token);


}
