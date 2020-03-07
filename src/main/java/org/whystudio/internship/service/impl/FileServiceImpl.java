package org.whystudio.internship.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import io.netty.util.internal.StringUtil;
import org.graalvm.compiler.lir.alloc.lsra.LinearScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.whystudio.internship.controller.ControllerUtil;
import org.whystudio.internship.entity.Appraisaldate;
import org.whystudio.internship.entity.File;
import org.whystudio.internship.mapper.FileMapper;
import org.whystudio.internship.service.IFileService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.whystudio.internship.util.JWTTool;
import org.whystudio.internship.util.QiNiuTool;
import org.whystudio.internship.vo.JsonResult;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 文件存储 服务实现类
 * </p>
 *
 * @author mrruan
 * @since 2020-03-05
 */
@Service
public class FileServiceImpl extends ServiceImpl<FileMapper, File> implements IFileService {

    public static final Logger logger = LoggerFactory.getLogger(FileServiceImpl.class);

    @Autowired
    IFileService fileService;
    @Autowired
    FileMapper fileMapper;

    @Override
    public JsonResult uploadToQiNiu(MultipartFile loadFile) {


        String type = QiNiuTool.getFileType(loadFile);
        String url = QiNiuTool.uploadQiNiu(loadFile);
        String size = String.valueOf(loadFile.getSize());
        if (url.isEmpty()) {
            logger.info("上传失败");
            return ControllerUtil.getFalseResultMsgBySelf("上传失败");
        }
        File file = new File();
        Integer s = Integer.valueOf(size) / 1024;
        file.setSize(s.toString() + "KB");
        file.setType(type);
        file.setUrl(url);
        try {
            fileService.save(file);
        } catch (Exception e) {
            e.printStackTrace();
            return ControllerUtil.getFalseResultMsgBySelf("保存到数据库失败");
        }
        return ControllerUtil.getSuccessResultBySelf("上传成功");

    }


    @Override
    public JsonResult deleteFileById(Integer id) {

        try {
            File file = fileMapper.selectById(id);
            String key = QiNiuTool.urlTokey(file.getUrl());
            if (QiNiuTool.deleteQiNiuFile(key)) {
                fileService.removeById(id);
            } else {
                return ControllerUtil.getFalseResultMsgBySelf("七牛云删除失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ControllerUtil.getFalseResultMsgBySelf("删除失败");
        }
        return ControllerUtil.getSuccessResultBySelf("删除成功");

    }

    @Override
    public JsonResult deleteFileByUrl(String url) {

        try {
            String key = QiNiuTool.urlTokey(url);
            if (QiNiuTool.deleteQiNiuFile(key)) {
                fileMapper.deleteByUrl(url);
            } else {
                return ControllerUtil.getFalseResultMsgBySelf("七牛云删除失败");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return ControllerUtil.getFalseResultMsgBySelf("删除失败");
        }
        return ControllerUtil.getSuccessResultBySelf("删除成功");

    }

    @Override
    public JsonResult getFileList() {

        List<File> fileList = fileMapper.selectList(null);
        return ControllerUtil.getSuccessResultBySelf(fileList);

    }
}
