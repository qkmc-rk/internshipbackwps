package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Corporation;
import org.whystudio.internship.entity.Student;
import org.whystudio.internship.mapper.CorporationMapper;
import org.whystudio.internship.mapper.StudentMapper;
import org.whystudio.internship.service.ICorporationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.service.IStudentService;
import org.whystudio.internship.util.EntityUtil;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.vo.JsonResult;

/**
 * <p>
 * 实习企业信息表
 * 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class CorporationServiceImpl extends ServiceImpl<CorporationMapper, Corporation> implements ICorporationService {

    @Autowired
    IStudentService studentService;

    @Override
    public JsonResult getCorporationInfo(String token) {
        String stuno = JWTTool.findToken(token);
        Corporation corporation = this.lambdaQuery().eq(Corporation::getStuno, stuno).one();
        if (null != corporation) {
            return ControllerUtil.getSuccessResultBySelf(corporation);
        } else {
            Corporation newCorp = new Corporation();
            newCorp.setStuno(stuno);
            newCorp.setCreditcode("");
            newCorp.setCorpname("");
            newCorp.setRegcode("");
            this.save(newCorp);
            return ControllerUtil.getSuccessResultBySelf(newCorp);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public JsonResult updateCorporationInfo(String token, Corporation corporation) {
        String stuno = JWTTool.findToken(token);
        Corporation oldCorp = this.lambdaQuery().eq(Corporation::getStuno, stuno).one();
        if (null != oldCorp) {
            corporation.setStuno(null);
            corporation.setCreated(null);
            corporation.setModified(null);
            corporation.setId(null);
            corporation.setIschecked(null);
            EntityUtil.update(corporation, oldCorp);
            this.updateById(corporation);
            // 同步更新学生信息的公司名称
            if (StringUtils.isNotBlank(corporation.getCorpname())) {
                studentService.lambdaUpdate().set(Student::getCorp,
                        corporation.getCorpname()).eq(Student::getStuno, stuno).update();
            }
            return ControllerUtil.getSuccessResultBySelf("修改成功");
        } else {
            return ControllerUtil.getFalseResultMsgBySelf("记录不存在，查看后重试");
        }
    }
}
