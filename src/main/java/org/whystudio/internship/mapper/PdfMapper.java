package org.whystudio.internship.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.whystudio.internship.entity.Pdf;

import java.util.List;

/**
 * <p>
 * 实习单位发布通知
 Mapper 接口
 * </p>
 * @author mrruan
 * @since 2020-03-05
 */
@Repository
public interface PdfMapper extends BaseMapper<Pdf> {

    /**
     * 通过ids查询列表, da
     * @param stuno
     * @param ids
     * @return
     */
    @Select({
            "<script>",
            "select *",
            "from pdf",
            "where stuno=#{stuno} and id in",
            "<foreach collection='ids' item='id' open='(' separator=',' close=')'>",
            "#{id}",
            "</foreach>",
            "</script>"
    })
    List<Pdf> selectByStunoAndReportAndIds(@Param("stuno") String stuno, @Param("ids") List<Long> ids);
}
