package org.whystudio.internship.util;

// 判断平台 不同平台的路径不一样
public class MultiPlatformPathTool {

    public static boolean isWindows(){
        String platform = System.getProperty("os.name");
        boolean isUnixBased = platform.toLowerCase().indexOf("linux") > -1 || platform.toLowerCase().indexOf("mac") > -1;
        if (isUnixBased){
            return false;   // 不是windows
        }else {
            return true;    // 不是windows
        }
    }

    public static boolean isLinux(){
        if (!isWindows()){
            String platform = System.getProperty("os.name");
            if (platform.toLowerCase().indexOf("linux") > -1){
                return true;
            }
        }
        return false;
    }

    public static boolean isMac(){
        if (!isWindows() && !isLinux()){
            return true;
        }
        return false;
    }
}
