package org.whystudio.internship.service;

import org.whystudio.internship.entity.Corporation;
import com.baomidou.mybatisplus.extension.service.IService;
import org.whystudio.internship.vo.JsonResult;

/**
 * <p>
 * 实习企业信息表
 服务类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
public interface ICorporationService extends IService<Corporation> {

    /**
     * 查询学生对应的企业信息
     *
     * @param token :
     * @return: org.whystudio.internship.vo.JsonResult
     */
    JsonResult getCorporationInfo(String token);

    /**
     * 学生修改企业信息
     *
     * @param token       :
     * @param corporation :
     * @return: org.whystudio.internship.vo.JsonResult
     */
    JsonResult updateCorporationInfo(String token, Corporation corporation);
}
