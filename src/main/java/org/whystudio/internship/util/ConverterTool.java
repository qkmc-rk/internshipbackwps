package org.whystudio.internship.util;

import com.jacob.com.ComThread;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;
import org.whystudio.internship.entity.Pdf;
import org.whystudio.internship.service.IAppraisalService;
import org.whystudio.internship.service.IPdfService;
import org.whystudio.internship.service.IReportService;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

/**
 *
 */
@Slf4j
@Component
public class ConverterTool {


    /**
     * 线程池操作对象
     */
    public static ThreadPoolExecutor poolExecutor;

    /**
     * 线程执行队列
     */
    public static LinkedBlockingQueue<Runnable> queue;


    /**
     * wps程序列表
     */
    public static List<WpsTask> wpsTaskList;


    /**
     * 线程池数量
     */
    private static final int POOL_SIZE = 5;


    /**
     * 设置一个 队列最大容量 以免未知错误直接爆炸
     */
    private static final int QUEUE_SIZE = 128;

    public static final String REPORT_FILE_NAME = "report.docx";

    public static final String IDENTIFY_FILE_NAME = "identify.docx";

    public static final String REPORT_PATH = "word" + File.separator + REPORT_FILE_NAME;

    public static final String IDENTIFY_PATH = "word" + File.separator + IDENTIFY_FILE_NAME;

    public static final String PDF_FILE_SUFFIX = ".pdf";

    private static String pdfSavePath;

    private static String wordPath;

    @Autowired
    IAppraisalService appraisalService;

    @Autowired
    IReportService reportService;

    @Autowired
    IPdfService pdfService;

    public static ConverterTool tool;

    @PostConstruct
    public void init() {
        ComThread.InitMTA();
        tool = this;
        queue = new LinkedBlockingQueue<>(QUEUE_SIZE);
        poolExecutor = new ThreadPoolExecutor(POOL_SIZE, POOL_SIZE, 0L, TimeUnit.MILLISECONDS,
                queue, new ConverterThreadFactory());
        wpsTaskList = new ArrayList<>();
        // 创建Wps进程等待调用

        for (int i = 0; i < POOL_SIZE; i++) {
            wpsTaskList.add(new WpsTask());
        }
        File wordDir = new File("word");
        File pdfDir = new File("pdf");
        if (!wordDir.exists()) {
            boolean mkdirResult = wordDir.mkdirs();
        }
        if (!pdfDir.exists()) {
            pdfDir.mkdirs();
        }

        wordPath = wordDir.getAbsolutePath();
        pdfSavePath = pdfDir.getAbsolutePath();

        copyWordTempleate();
    }


    public boolean add(String stuno, boolean isReport) {
        try {
            poolExecutor.execute(() -> {
                long start = System.currentTimeMillis();
                boolean result;
                Pdf pdf = new Pdf();
                pdf.setStuno(stuno);
                pdf.setConverting(true);
                pdf.setUrl("-");
                pdf.setReport(isReport);
                String wordTempPath = isReport ? wordPath + File.separator + REPORT_FILE_NAME : wordPath + File.separator + IDENTIFY_FILE_NAME;
                try {
                    // 获取线程编号 每个线程操作与其对应的wps进程，不支持多线程同时操作一个
                    int threadNum = Integer.parseInt(Thread.currentThread().getName().split("-")[1]);
                    Map<String, String> params = isReport ? reportService.getReportInfoInJodFormatByStuno(stuno) : appraisalService.getAppraisalInfoInJodFormatByStuno(stuno);
                    // pdf文件路径
                    StringBuilder pdfOutPutPath = new StringBuilder(pdfSavePath);
                    pdfOutPutPath.append(File.separator)
                            .append(params.get("${stuno}"))
                            .append("_")
                            .append(isReport ? "实习报告册" : "实习鉴定表")
                            .append("_")
                            .append(System.currentTimeMillis())
                            .append(PDF_FILE_SUFFIX);
                    // topdf
                    result = wpsTaskList.get(threadNum - 1).toPdf(wordTempPath, pdfOutPutPath.toString(), params);
                    log.info("学号:{},是否报告册: {},转换结果: {}", stuno, isReport, result);
                    if (result) {
                        File pdfOutFile = new File(pdfOutPutPath.toString());
                        FileInputStream fis = new FileInputStream(pdfOutFile);
                        String url = QiNiuTool.uploadQiNiu(fis, pdfOutFile.getName());
                        fis.close();
                        if (url != null) {
                            pdf.setUrl(url);
                            pdf.setFailed(false);
                            log.info("{}上传成功,转换&上传共耗时:{} ms,URL:{}", pdfOutFile.getName(), System.currentTimeMillis() - start, url);
                        }
                    }
                } catch (Exception e) {
                    pdf.setFailed(true);
                    log.error(e.getMessage());
                    e.printStackTrace();
                } finally {
                    pdf.setConverting(false);
                    pdfService.save(pdf);
                }
            });
        } catch (Exception e) {
            log.error(e.getMessage());
            return false;
        }
        return true;
    }

    @PreDestroy
    public void quit() {
        poolExecutor.shutdown();
        for (WpsTask wpsTask : wpsTaskList) {
            wpsTask.quit();
        }
        log.info("wps程序已关闭");
        ComThread.Release();
    }

    /**
     * 用于拷贝word模板文件
     */
    private void copyWordTempleate() {

        File targetReport = new File(wordPath + File.separator + REPORT_FILE_NAME);
        File targetIdentify = new File(wordPath + File.separator + IDENTIFY_FILE_NAME);

        ClassPathResource reportResource = new ClassPathResource(REPORT_PATH);
        ClassPathResource identifyResource = new ClassPathResource(IDENTIFY_PATH);
        try (InputStream reportIs = reportResource.getInputStream();
             FileOutputStream reportFos = new FileOutputStream(targetReport);
             InputStream identifyIs = identifyResource.getInputStream();
             FileOutputStream identifyFos = new FileOutputStream(targetIdentify)) {
            targetReport.delete();
            targetIdentify.delete();
            targetReport.createNewFile();
            targetIdentify.createNewFile();

            byte[] buffer = new byte[1024];

            int length;
            while ((length = reportIs.read(buffer)) > 0) {
                reportFos.write(buffer, 0, length);
            }
            while ((length = identifyIs.read(buffer)) > 0) {
                identifyFos.write(buffer, 0, length);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}


class ConverterThreadFactory implements ThreadFactory {

    private final AtomicInteger threadNumber = new AtomicInteger(1);

    private static final String NAME_PREFIX = "Converter-";

    @Override
    public Thread newThread(Runnable r) {
        Thread t = new Thread(r, NAME_PREFIX + threadNumber.getAndIncrement());
        if (t.isDaemon()) {
            t.setDaemon(true);
        }
        if (t.getPriority() != Thread.NORM_PRIORITY) {
            t.setPriority(Thread.NORM_PRIORITY);
        }
        return t;
    }
}
