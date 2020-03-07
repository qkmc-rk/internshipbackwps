package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Corporation;
import org.whystudio.internship.mapper.CorporationMapper;
import org.whystudio.internship.service.ICorporationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
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
    @Override
    public JsonResult getCorporationInfo(String token) {
        String stuno = JWTTool.findToken(token);
        if (StringUtils.isNotBlank(stuno)) {
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
        return ControllerUtil.getFalseResultMsgBySelf("无效的Token");
    }

    @Override
    public JsonResult updateCorporationInfo(String token, Corporation corporation) {
        String stuno = JWTTool.findToken(token);
        if (StringUtils.isNotBlank(stuno)) {
            Corporation oldCorp = this.lambdaQuery().eq(Corporation::getStuno, stuno).one();
            if (null != oldCorp) {
                corporation.setStuno(null);
                corporation.setCreated(null);
                corporation.setModified(null);
                corporation.setId(null);
                corporation.setIschecked(null);
                EntityUtil.update(corporation, oldCorp);
                return ControllerUtil.getSuccessResultBySelf("修改成功");
            } else {
                return ControllerUtil.getFalseResultMsgBySelf("记录不存在，查看后重试");
            }
        }
        return ControllerUtil.getFalseResultMsgBySelf("无效的Token");
    }
}
