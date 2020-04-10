package org.whystudio.internship.util;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;

import org.springframework.stereotype.Service;
import org.whystudio.internship.entity.Pdf;
import org.whystudio.internship.service.IAppraisalService;
import org.whystudio.internship.service.IPdfService;
import org.whystudio.internship.service.IReportService;
import org.whystudio.internship.vo.JodItem;

import javax.annotation.PostConstruct;
import java.io.*;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.ConcurrentLinkedQueue;

/**
 * word生成服务
 * 准确说这是一个服务，不是tool, 因为其中充满了业务逻辑的味道
 * 但是似乎它又不太属于服务, 暂时放到util包下，后期在改进
 */

@Slf4j
@Service
public class JodService {

    @Autowired
    IReportService reportService;

    @Autowired
    IAppraisalService appraisalService;

    @Autowired
    IPdfService pdfService;


    /**
     * 实习报告册模板的保存位置
     * classpath(resources)下
     */
    public static String REPORT_PATH = MultiPlatformPathTool.isWindows() ? "word\\report.docx" : "word/report.docx";

    /**
     * 实习鉴定表模板路径
     * classpath(resources)下
     */
    public static String IDENTIFY_PATH = MultiPlatformPathTool.isWindows() ? "word\\identify.docx" : "word/identify.docx";

    /**
     * 基本保存路径
     */
    public static String BASE_SAVE_PATH;

    public static Long REC_THRESHOLD = 10L;
    /**
     * 计数器, 计数当前转完完成的任务总数 初始化不为0是为了除
     * 这个计数器和下面的总任务耗时可以单独建立一个线程监听，如果超过某个值就给重置,
     * 但目前没必要, 这个任务难道会超过10亿次？
     * 另外还可以设置异常检测, 如果某次耗时超过30s, 应该是检测异常, 则不计算
     * 不过也没有必要,体现不了任何价值
     */
    public static Long COUNT = 1L;

    /**
     * 总秒数, 转换所有任务总共耗时
     */
    public static Long TOTAL_SECOND = 5L;

    /**
     * 转换队列
     * 通过http向队列添加转换任务
     */
    private static ConcurrentLinkedQueue<JodItem> queue = new ConcurrentLinkedQueue<>();

    public static JodService jodService;

    @PostConstruct
    public void init() {
        jodService = this;
        executeJodTask(); // 开始执行转换任务,
        // 创建pdf存放路径
        File pdfDir = new File("static");
        if (!pdfDir.exists()) {
            pdfDir.mkdirs();
        }
        // 更新pdf路径为绝对路径
        BASE_SAVE_PATH = pdfDir.getAbsolutePath() + File.separator;

        // 创建word模板存放路径
        File wordDir = new File("word");
        if (!wordDir.exists()) {
            wordDir.mkdirs();
        }

        // 复制出word模板文件 操作jar包内的文件会报错
        File targetReport = new File(wordDir.getAbsoluteFile() + File.separator + "report.docx");
        File targetIdentify = new File(wordDir.getAbsoluteFile() + File.separator + "identify.docx");
        try (InputStream reprotStream = new ClassPathResource(REPORT_PATH).getInputStream();
             InputStream identifyStream = new ClassPathResource(IDENTIFY_PATH).getInputStream();
             FileOutputStream targetReportStream = new FileOutputStream(targetReport);
             FileOutputStream targetIdentifyStream = new FileOutputStream(targetIdentify)) {
            byte[] buffer = new byte[1024];
            int length;

            while ((length = reprotStream.read(buffer)) > 0) {
                targetReportStream.write(buffer, 0, length);
            }
            while ((length = identifyStream.read(buffer)) > 0) {
                targetIdentifyStream.write(buffer, 0, length);
            }
            IDENTIFY_PATH = targetIdentify.getAbsolutePath();
            REPORT_PATH = targetReport.getAbsolutePath();
        } catch (IOException e) {
            log.error("模板文件复制失败,无法完成PDF转换");
            e.printStackTrace();
        }
    }

    /**
     * 增加一个转换任务
     *
     * @param jodItem
     */
    public Boolean addTask(JodItem jodItem) {
        if (jodItem == null || StringUtils.isBlank(jodItem.getStuno())) {
            return false;
        }
        queue.offer(jodItem);
        return true;
    }

    /**
     * 获取当前任务的位置
     *
     * @param stuno
     * @return
     */
    public String getPosition(String stuno, Boolean report) {
        int count = 0;
        int size = queue.size();
        for (JodItem jodItem : queue) {
            count++;
            if (jodItem.getStuno().equals(stuno) && jodItem.getReport().equals(report)) {
                break;
            }
        }
        StringBuilder rs = new StringBuilder();
        if (size < count) {
            rs.append("当前队列没有您的任务!");
        } else {
            rs.append("当前队列总共");
            rs.append(size);
            rs.append("个任务,");
            rs.append("您的最近一个任务处于位置");
            rs.append(count);
            rs.append(",预计耗费时间:");
            rs.append((TOTAL_SECOND / COUNT) * count);
        }
        return rs.toString();
    }

    /**
     * 在队列中查找是否存在我的任务
     *
     * @param stuno
     * @return
     */
    public Boolean existMyTask(String stuno, Boolean report) {
        for (JodItem jodItem : queue) {
            if (jodItem.getStuno().equals(stuno) && jodItem.getReport().equals(report)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 跳过头结点位置处任务 一般不会使用
     *
     * @return
     */
    public JodItem popTask() {
        return queue.poll();
    }

    /**
     * 执行word文档生成任务,队列中有多个任务, 一个任务一个任务地执行
     */
    //@Transactional
    public void executeJodTask() {
        new Thread(() -> {
            while (true) {
                JodItem jodItem = queue.poll();
                Pdf pdf = new Pdf();
                pdf.setConverting(true);
                pdf.setUrl("-");
                try {
                    if (jodItem != null) {
                        LocalDateTime start = LocalDateTime.now();
                        log.info("学号{},位置:{}(数值 + 1, 位置0代表1), 开始转换时间:{}", jodItem.getStuno(), getPosition(jodItem.getStuno(), jodItem.getReport()), start);
                        // 转换任务存储到数据库, 并标记状态为未完成
                        // id在new时便已经设置好 暂时使用随机long
                        pdf.setReport(jodItem.getReport());
                        pdf.setStuno(jodItem.getStuno());
                        pdfService.saveOrUpdate(pdf);

                        // 从数据库读取report、reportData或者appraisal、appraisalDate, 然后生成params
                        Map<String, String> params;
                        String targetPath = BASE_SAVE_PATH + MD5Tool.md5(String.valueOf(LocalDateTime.now())) + ".pdf";
                        File sourceDocx;
                        if (jodItem.getReport()) {
                            params = reportService.getReportInfoInJodFormatByStuno(jodItem.getStuno());
                            if (params.isEmpty()) {
                                continue;
                            }
                            sourceDocx = new File(REPORT_PATH);
                        } else {
                            params = appraisalService.getAppraisalInfoInJodFormatByStuno(jodItem.getStuno());
                            if (params.isEmpty()) {
                                continue;
                            }
                            sourceDocx = new File(IDENTIFY_PATH);
                        }

                        boolean isSuccess = JacobTool.getTool().toPdf(sourceDocx.getAbsolutePath(), targetPath, params);

                        if (!isSuccess) {
                            log.error("PDF生成失败,学号:{}", jodItem.getStuno());
                            continue;
                        }
                        // 上传到七牛云
                        File targetPdf = new File(targetPath);
                        FileInputStream targetPdfStream = new FileInputStream(targetPdf);
                        String url = QiNiuTool.uploadQiNiu(targetPdfStream, targetPdf.getName());
                        targetPdfStream.close();

                        pdf.setUrl(url);
                        pdf.setConverting(false);
                        pdfService.saveOrUpdate(pdf);
                        // 嘿嘿
                        Long durex = Duration.between(start, LocalDateTime.now()).getSeconds();
                        if (durex > REC_THRESHOLD) {
                            // 大于10s的才记录
                            COUNT++;
                            TOTAL_SECOND += Duration.between(start, LocalDateTime.now()).getSeconds();
                        }
                        log.info("学号{},转换加上传到QiNiu耗时:{}s", jodItem.getStuno(),
                                Duration.between(start, LocalDateTime.now()).getSeconds());
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    pdf.setFailed(true);
                    pdfService.saveOrUpdate(pdf);
                    continue;
                }
                // 如果队列中没有任务, 就让线程休息一会儿
                if (queue.size() < 1) {
                    try {
                        Thread.sleep(3000);
                    } catch (InterruptedException e) {
                        log.error(e.getMessage());
                    }
                }
            }
        }).start();
    }
}