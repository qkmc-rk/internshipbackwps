package org.whystudio.internship.aop;

import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.whystudio.internship.annotation.StageValidation;
import org.whystudio.internship.dto.StageDto;
import org.whystudio.internship.exception.RRException;
import org.whystudio.internship.service.IStageService;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.vo.Const;

/**
 * @author Ning
 */
@Component
@Aspect
public class StageAspect {
    @Autowired
    IStageService stageService;

    @Pointcut("@annotation(org.whystudio.internship.annotation.StageValidation)")
    public void stagePoint() {
    }

    @Before("stagePoint() && @annotation(stageValidation)")
    public void doBefore(JoinPoint joinPoint, StageValidation stageValidation) {
        Object[] args = joinPoint.getArgs();
        String userno;
        if (stageValidation.type() == Const.STAGE_LOGIN) {
            userno = String.valueOf(joinPoint.getArgs()[0]);
        } else {
            String token = String.valueOf(args[0]);
            userno = JWTTool.findToken(token);
        }
        StageDto stage = stageService.getCollegeStage(userno);
        if (stageValidation.type() == Const.STAGE_REPORT) {
            if (stage.getReportStage() < stageValidation.stage()) {
                throw new RRException("当前阶段未开放");
            }
        } else if (stageValidation.type() == Const.STAGE_APPRAISAL) {
            if (stage.getAppraisalStage() < stageValidation.stage()) {
                throw new RRException("当前阶段未开放");
            }
        } else if (stageValidation.type() == Const.STAGE_LOGIN) {
            if (stage.getReportStage() == Const.STAGE_OFF && stage.getAppraisalStage() == Const.STAGE_OFF) {
                throw new RRException("当前系统未开放");
            }
        }
    }
}
