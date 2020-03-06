package org.whystudio.internship.service;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.whystudio.internship.entity.Reportdate;
import com.baomidou.mybatisplus.extension.service.IService;
import org.whystudio.internship.vo.JsonResult;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
public interface IReportdateService extends IService<Reportdate> {
    /**
     * 学生填写报告册第一二阶段时间段
     *
     * @param token      :
     * @param reportdate :
     * @return: org.whystudio.internship.vo.JsonResult
     */
    JsonResult updateReportDate(String token, Reportdate reportdate);
}
