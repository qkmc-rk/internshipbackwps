package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Pdf;
import org.whystudio.internship.mapper.PdfMapper;
import org.whystudio.internship.service.IPdfService;
import org.whystudio.internship.util.ConverterTool;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.util.QiNiuTool;
import org.whystudio.internship.vo.Const;
import org.whystudio.internship.vo.JsonResult;

import java.util.*;

/**
 * <p>
 * pdf文件信息存取服务
 * 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */

@Slf4j
@Service
public class PdfServiceImpl extends ServiceImpl<PdfMapper, Pdf> implements IPdfService {

    @Autowired
    PdfMapper pdfMapper;



    @Override
    public JsonResult executeConvertReportTask(String token) {
        return execute(token, true);
    }

    @Override
    public JsonResult executeConvertAppraisalTask(String token) {
        return execute(token, false);
    }

    @Override
    public JsonResult myTask(String token) {
        String stuno = JWTTool.findToken(token);
        String report = JodService.jodService.getPosition(stuno, true);
        String appraisal = JodService.jodService.getPosition(stuno, false);
        Map<String, String> rs = new HashMap<>();
        rs.put("report", report);
        rs.put("appraisal", appraisal);
        return ControllerUtil.getSuccessResultBySelf(rs);
    }

    @Override
    public JsonResult allMyPdf(String token, Boolean report) {
        String stuno = JWTTool.findToken(token);
        LambdaQueryWrapper<Pdf> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(Pdf::getStuno, stuno);
        if (null != report && report) {
            // 实习报告册
            queryWrapper.eq(Pdf::getReport, true);
        } else if (null != report) {
            // 鉴定表
            queryWrapper.eq(Pdf::getReport, false);
        }
        queryWrapper.orderByDesc(Pdf::getCreated);
        List<Pdf> pdfList = pdfMapper.selectList(queryWrapper);
        return ControllerUtil.getDataResult(pdfList);

    }

    @Override
    public JsonResult deleteByIds(String token, List<Long> pdfIds) {
        if (pdfIds == null && pdfIds.size() < 1) {
            return ControllerUtil.getFalseResultMsgBySelf("数据错误:{}", pdfIds);
        }
        String stuno = JWTTool.findToken(token);
        List<Pdf> pdfs = pdfMapper.selectByStunoAndReportAndIds(stuno, pdfIds);
        //从七牛云删除
        List<String> keys = new ArrayList<>();
        for (Pdf pdf :
                pdfs) {
            if (!pdf.getUrl().equals("-")) {
                // 此处应该不会有异常的。。
                keys.add(pdf.getUrl().split("/")[1]);
            }
        }
        keys.forEach(log::info);
        log.info("{}", QiNiuTool.deleteQiNiuFileBatch(keys.toArray(new String[keys.size()])));
        LambdaUpdateWrapper<Pdf> lambdaUpdateWrapper = Wrappers.lambdaUpdate();
        lambdaUpdateWrapper.in(Pdf::getId, pdfIds);
        lambdaUpdateWrapper.eq(Pdf::getStuno, stuno);
        Integer rows = pdfMapper.delete(lambdaUpdateWrapper);
        return ControllerUtil.getSuccessResultBySelf("删除了" + rows + "条数据");
    }

    private JsonResult execute(String token, Boolean report) {
        String stuno = JWTTool.findToken(token);
        if (ConverterTool.tool.add(stuno, report)) {
            return ControllerUtil.customResult(Const.OPERATION_SUCCESS, "添加成功", "");
        }
        return ControllerUtil.customResult(Const.COMMON_ERROR, "任务插入队列失败!队列已满", "");
    }
}
