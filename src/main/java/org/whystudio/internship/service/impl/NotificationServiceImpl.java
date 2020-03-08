package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Notification;
import org.whystudio.internship.mapper.NotificationMapper;
import org.whystudio.internship.service.INotificationService;
import org.whystudio.internship.vo.JsonResult;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 实习单位发布通知
 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class NotificationServiceImpl extends ServiceImpl<NotificationMapper, Notification> implements INotificationService {

    @Resource
    NotificationMapper mapper;

    @Override
    public JsonResult newsList(Integer page, Integer limit) {
        IPage<Notification> notificationIPage=new Page<>(page,limit);
        QueryWrapper<Notification> queryWrapper=new QueryWrapper<>();
        notificationIPage=mapper.selectPage(notificationIPage,queryWrapper.orderByDesc("id"));
        List<Notification> list=notificationIPage.getRecords();
        return ControllerUtil.getDataResult(list);
    }

    @Override
    public JsonResult whichNews(Long id) {
        List<Notification> list=mapper.selectNearId(Math.toIntExact(id));
        Map<String,String> result=new HashMap<>();
        //Notification notification=mapper.selectById(id);
        if(list.size()==2){
            for(Notification n: list){
                if(id.equals(n.getId())){
                    result.put("target",n.toString());
                }
                else if(n.getId()>id){
                    result.put("nextId",String.valueOf(n.getId()));
                    result.put("prevId","前面已经没数据啦::>_<::");
                }
                else {
                    result.put("prevId",String.valueOf(n.getId()));
                    result.put("nextId","后面已经没数据啦::>_<::");
                }
            }
        }
        else {
            result.put("target",list.get(1)==null?null:list.get(1).toString());
            result.put("nextId",list.get(2)==null?null:String.valueOf(list.get(2).getId()));
            result.put("prevId",list.get(0)==null?null:String.valueOf(list.get(0).getId()));
        }

        return ControllerUtil.getDataResult(result);
    }
}
