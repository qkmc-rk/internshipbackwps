package org.whystudio.internship.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.whystudio.internship.entity.Notification;

import java.util.List;

/**
 * <p>
 * 实习单位发布通知
 Mapper 接口
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Repository
public interface NotificationMapper extends BaseMapper<Notification> {

    /**
     * 查询id上下各一条的记录
     * @param id
     * @return
     */
    @Select("SELECT * from notification where id in \n" +
            "((SELECT id from notification where id < #{id} ORDER BY id desc limit 1),\n" +
            "#{id},\n" +
            "(select id from notification where id > #{id} order by id asc limit 1));")
    List<Notification> selectNearId(@Param("id") Integer id);
}
