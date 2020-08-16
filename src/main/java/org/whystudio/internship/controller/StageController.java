package org.whystudio.internship.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.whystudio.internship.annotation.Auth;
import org.whystudio.internship.dto.StageDto;
import org.whystudio.internship.entity.Stage;
import org.whystudio.internship.service.IStageService;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.vo.Const;
import org.whystudio.internship.vo.JsonResult;

/**
 * 阶段开放状态
 */
@RestController
@CrossOrigin
@RequestMapping("stage")
public class StageController {

    @Autowired
    IStageService stageService;

    @ApiOperation(value = "获取该生所在学院的阶段状态")
    @GetMapping("/college")
    @Auth(role = Const.AUTH_STUDENT)
    public JsonResult getCollegeStage(@RequestHeader String token) {
        String stuno = JWTTool.findToken(token);
        StageDto stageDto = stageService.getCollegeStage(stuno);
        return ControllerUtil.getDataResult(stageDto);
    }
}
