package org.whystudio.internship.util;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * MD5加密类
 * @author mrruan
 */
public class MD5Tool {

    public static String md5WithSalt(String text, String salt) {
        String encodeStr = DigestUtils.md5Hex(text + salt);
        return encodeStr;
    }

    public static String md5(String text) {
        String str = DigestUtils.md5Hex(text);
        return str;
    }

    public static boolean verifyWithNoSalt(String text, String md5) {
        String md5Text = md5(text);
        if (md5Text.equalsIgnoreCase(md5)) {
            return true;
        }
        return false;
    }
    public static boolean verifyWithSalt(String text, String salt, String md5) {
        String md5Text = md5WithSalt(text, salt);
        if (md5Text.equalsIgnoreCase(md5)) {
            return true;
        }
        return false;
    }
}
