package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Pdf;
import org.whystudio.internship.mapper.PdfMapper;
import org.whystudio.internship.service.IPdfService;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.util.JodService;
import org.whystudio.internship.util.RedisTool;
import org.whystudio.internship.vo.Const;
import org.whystudio.internship.vo.JodItem;
import org.whystudio.internship.vo.JsonResult;

/**
 * <p>
 * pdf文件信息存取服务
 * 服务实现类
 * </p>
 * @author mrruan
 * @since 2020-03-05
 */

@Service
public class PdfServiceImpl extends ServiceImpl<PdfMapper, Pdf> implements IPdfService {

    @Override
    public JsonResult executeConvertReportTask(String token) {
        String stuno = JWTTool.findToken(token);
        JodItem jodItem = new JodItem();
        jodItem.setStuno(stuno);
        jodItem.setReport(true);
        if (JodService.jodService.addTask(jodItem)){
            return ControllerUtil.customResult(Const.OPERATION_SUCCESS, JodService.jodService.getPosition(stuno), "");
        }
        return ControllerUtil.customResult(Const.COMMON_ERROR, "任务插入队列失败!队列已满", "");
    }
}
