package org.whystudio.internship.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.whystudio.internship.entity.Pdf;
import org.whystudio.internship.vo.JsonResult;

import java.util.List;

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
     *
     * @param token
     * @return
     */
    JsonResult executeConvertReportTask(String token);

    JsonResult executeConvertAppraisalTask(String token);


    /**
     * 获取我的pdf文件信息
     *
     * @param token  token
     * @param report 是否是report
     * @return
     */
    JsonResult allMyPdf(String token, Boolean report);

    /**
     * 通过 id 删除转换的pdf文件
     *
     * @param token
     * @param pdfIds
     * @return
     */
    JsonResult deleteByIds(String token, List<Long> pdfIds);

}
