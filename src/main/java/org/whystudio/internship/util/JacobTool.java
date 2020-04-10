package org.whystudio.internship.util;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

import java.util.Map;

/**
 * @author Ning
 */
public class JacobTool {

    private static JacobTool tool;

    /**
     * word运行程序对象
     */
    private ActiveXComponent word;

    /**
     * word文档对象
     */
    private Dispatch doc;

    /**
     * word文档集合
     */
    private Dispatch documents;

    /**
     * 选定的范围或插入点
     */
    private Dispatch selection;


    /**
     * 设置窗口是否可见
     */
    private final boolean visible = false;

    /**
     * 组件常量,退出时不保存
     */
    private final boolean saveOnExit = false;


    /**
     * 组件常量,另存为中表示PDF
     */
    private static final int wdFormatPDF = 17;

    public static synchronized JacobTool getTool() {
        if (null == tool) {
            tool = new JacobTool();
        }
        return tool;
    }


    /**
     * 打开一个Word文档
     *
     * @param docPath 文档绝对路径
     */
    private void open(String docPath) {
        //  初始化com线程
        ComThread.InitMTA();
        word = new ActiveXComponent("Word.Application");
        // 设置窗口不可见
        word.setProperty("Visible", visible);
        documents = word.getProperty("Documents").toDispatch();
        doc = Dispatch.call(documents, "Open", docPath).toDispatch();
        selection = Dispatch.get(word, "Selection").toDispatch();
    }


    /**
     * 光标移动到文档开头
     */
    private void moveStart() {
        Dispatch.call(selection, "HomeKey", new Variant(6));
    }

    private void replace(String source, String target) {
        // 判断一下字符串是否未null 避免pdf中出现null字符串
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
        //  全字匹配
        Dispatch.put(find, "MatchWholeWord", "True");
        //  查找并选中
        boolean isExecute = Dispatch.call(find, "Execute").getBoolean();
        if (isExecute) {
            // 替换
            Dispatch.put(selection, "Text", target);
        }
    }

    /**
     * 另存为pdf
     *
     * @param targetPath 文档输出全路径
     */
    private void saveAsPdf(String targetPath) {
        Dispatch.call(doc, "SaveAs", targetPath, wdFormatPDF);
    }

    /**
     * 关闭word文档
     */
    private void close() {
        Dispatch.call(doc, "Close", saveOnExit);
    }

    /**
     * 关闭word程序
     */
    private void quit() {
        Dispatch.call(word, "Quit", saveOnExit);
        // 释放com线程
        ComThread.Release();
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
            close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            quit();
        }
        return true;
    }
}
