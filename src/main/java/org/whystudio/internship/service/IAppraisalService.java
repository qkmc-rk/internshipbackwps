package org.whystudio.internship.service;

import org.whystudio.internship.entity.Appraisal;
import com.baomidou.mybatisplus.extension.service.IService;
import org.whystudio.internship.vo.JsonResult;

/**
 * <p>
 * 实习鉴定表 服务类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
public interface IAppraisalService extends IService<Appraisal> {

    /**
     * 学生获取鉴定表信息
     *
     * @param token :
     * @return: org.whystudio.internship.vo.JsonResult
     */
    JsonResult getAppraisalInfo(String token);

    /**
     * 学生修改鉴定表
     *
     * @param token     :
     * @param appraisal :
     * @return: org.whystudio.internship.vo.JsonResult
     */
    JsonResult updateAppraisalInfo(String token, Appraisal appraisal);
}
