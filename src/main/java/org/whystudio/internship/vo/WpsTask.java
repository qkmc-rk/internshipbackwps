package org.whystudio.internship.vo;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
import lombok.extern.slf4j.Slf4j;

import java.util.Map;

/**
 * @author Ning
 */
@Slf4j
public class WpsTask {

    /**
     * wps运行程序对象
     */
    private ActiveXComponent word;

    /**
     * word文档集合
     */
    private Dispatch documents;

    /**
     * word文档对象
     */
    private Dispatch doc;


    /**
     * 选定的范围或插入点
     */
    private Dispatch selection;


    /**
     * 窗口是否可见
     */
    private final boolean VISIBLE = true;

    /**
     * 组件常量,退出时不保存
     */
    private static final boolean SAVE_ON_EXIT = false;

    /**
     * 组件常量,另存为中表示PDF
     */
    public static final int WD_FORMATPDF = 17;


    public WpsTask() {
        this(false);
    }


    /**
     * @param visible 窗口是否可见
     */
    public WpsTask(boolean visible) {
        word = new ActiveXComponent("Kwps.Application");
        word.setProperty("Visible", visible);
        documents = word.getProperty("Documents").toDispatch();
    }


    /**
     * 打开一个Word文档
     *
     * @param docPath 文档绝对路径
     */
    public void open(String docPath) {
        doc = Dispatch.call(documents, "Open", docPath).toDispatch();
        selection = Dispatch.get(word, "Selection").toDispatch();
    }


    /**
     * 光标移动到行首
     */
    public void moveStart() {
        Dispatch.call(selection, "HomeKey", new Variant(6));
    }

    public void replace(String source, String target) {
        // 判断一下字符串是否为null 避免pdf中出现null字符串
        target = null == target || "null".equals(target) ? "" : target;
        moveStart();
        Dispatch find = Dispatch.call(selection, "Find").toDispatch();
        //  设置查找内容
        Dispatch.put(find, "Text", source);
        //  向前查找
        Dispatch.put(find, "Forward", "True");
        //  设置格式
        Dispatch.put(find, "Format", "True");
        //  大小写匹配
        Dispatch.put(find, "MatchCase", "True");
        //  全字匹配 不开启 否则模板标签后必须是空格才能被选中
//        Dispatch.put(find, "MatchWholeWord", "True");
        //  查找并选中
        Dispatch.call(find, "Execute").getBoolean();
        // 替换
        Dispatch.put(selection, "Text", target);

    }

    /**
     * 另存为pdf
     *
     * @param targetPath 文档输出全路径
     */
    public void saveAsPdf(String targetPath) {
        Dispatch.call(doc, "SaveAs", targetPath, WD_FORMATPDF);
    }

    /**
     * 关闭word文档
     */
    public void close() {
        Dispatch.call(doc, "Close", SAVE_ON_EXIT);
    }


    /**
     * 退出wps程序
     */
    public void quit() {
        Dispatch.call(word, "Quit", SAVE_ON_EXIT);
    }

    /**
     * word渲染并输出为pdf
     *
     * @param sourcePath word文件路径
     * @param targetPath pdf输出路径
     * @param params     渲染参数
     * @return 是否成功
     */
    public boolean toPdf(String sourcePath, String targetPath, Map<String, String> params) {
        try {
            open(sourcePath);
            params.forEach(this::replace);
            saveAsPdf(targetPath);
        } catch (Exception e) {
            log.error(e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            close();
        }
        return true;
    }

}
