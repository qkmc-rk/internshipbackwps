package org.whystudio.internship.service;

import org.whystudio.internship.entity.Report;
import com.baomidou.mybatisplus.extension.service.IService;
import org.whystudio.internship.entity.Reportdate;
import org.whystudio.internship.vo.JsonResult;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
public interface IReportService extends IService<Report> {
    /**
     * 学生查询报告册信息
     *
     * @param token :
     * @return: org.whystudio.internship.vo.JsonResult
     */
    JsonResult getReportInfo(String token);

    /**
     * 学生填写报告册第一阶段
     *
     * @param token  :
     * @param report :
     * @return: org.whystudio.internship.vo.JsonResult
     */
    JsonResult updateReportStage1(String token, Report report);

    /**
     * 学生填写报告册第二阶段
     *
     * @param token  :
     * @param report :
     * @return: org.whystudio.internship.vo.JsonResult
     */
    JsonResult updateReportStage2(String token, Report report);


}
