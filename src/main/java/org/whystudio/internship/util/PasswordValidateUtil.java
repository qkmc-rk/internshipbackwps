package org.whystudio.internship.util;

public class PasswordValidateUtil {

    public static boolean validatePassword(String password) {
        // 定义正则表达式
        //必须包含大小写字幕和数字
        String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$";

        // 使用matches方法进行校验
        return password.matches(regex);
    }
}
