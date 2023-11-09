package org.whystudio.internship.util;

import cn.hutool.crypto.digest.DigestAlgorithm;
import cn.hutool.crypto.digest.Digester;
import org.apache.tomcat.util.codec.binary.Base64;
import org.whystudio.internship.entity.Student;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Random;

/**
 * 传入一个string，然后返回一个加密的str和字符串，
 */
public class PropertyEncryptUtil {
    /**
     * 对传入的string字段利用时间戳进行加密,加密逻辑是先对时间戳进行MD5，然后截取前十位在进行MD5,得到key在对原字符串进行加解密
     * @param inputStr 传入字符串
     * @param timestamp 生成的时间戳
     * @return 加密后的str, 加密为16进制表示
     * @throws UnsupportedEncodingException
     */
    public static String encrypt(String inputStr, long timestamp) throws UnsupportedEncodingException {
        Digester md5 = new Digester(DigestAlgorithm.MD5);
        String digestStr = md5.digestHex(String.valueOf(timestamp));
        // 截取前10个字符
        String subStr = digestStr.substring(0, 10);
        // 对截取后的字符串再次进行MD5加密
        String secondDigestStr = md5.digestHex(subStr);
        secondDigestStr = secondDigestStr.substring(0,16);
        // 用得到的字符串作为AES的key
        byte[] key = secondDigestStr.getBytes(StandardCharsets.UTF_8);
        byte[] iv = key;
        try {
            //"算法/模式/补码方式"NoPadding PkcsPadding
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            int blockSize = cipher.getBlockSize();
            byte[] dataBytes = inputStr.getBytes();
            int plaintextLength = dataBytes.length;
            if (plaintextLength % blockSize != 0) {
                plaintextLength = plaintextLength + (blockSize - (plaintextLength % blockSize));
            }
            byte[] plaintext = new byte[plaintextLength];
            System.arraycopy(dataBytes, 0, plaintext, 0, dataBytes.length);
            cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));
            byte[] encrypted = cipher.doFinal(plaintext);
            return new Base64().encodeToString(encrypted);
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    public static String decrypt(String encryptStr, String timestamp){
        Digester md5 = new Digester(DigestAlgorithm.MD5);
        String digestStr = md5.digestHex(timestamp);
        // 截取前10个字符
        String subStr = digestStr.substring(0, 10);
        // 对截取后的字符串再次进行MD5加密
        String secondDigestStr = md5.digestHex(subStr);
        secondDigestStr = secondDigestStr.substring(0,16);
        // 用得到的字符串作为AES的key
        byte[] key = secondDigestStr.getBytes(StandardCharsets.UTF_8);
        byte[] iv = key;
        try {
            byte[] encrypted = new Base64().decode(encryptStr);
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));
            byte[] original = cipher.doFinal(encrypted);
            return new String(original).trim();
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    /**
     * 这里对传入的resultMap进行字段加密，每一个字段都进行加密
     * 如果值为null则不进行加密
     * @param resultMap
     */
    public static Map<String, Object> encryptFields(Map<String, Object> resultMap, long timestamp) throws UnsupportedEncodingException {
        for (String key : resultMap.keySet()) {
            //仅仅对字符串进行加密
            if (resultMap.get(key) instanceof String){
                String value = (String) resultMap.get(key);
                if ((value != null)){
                    resultMap.put(key, encrypt(value, timestamp));
                }else {
                    resultMap.put(key, null);
                }
            }
        }
        return resultMap;
    }


    /**
     * 本来是做student的字段解密，然后想做成泛型，但是泛型似乎做不了，
     * 这里用到了反射所以不能使用static方法，因为不支持static访问非static属性
     * 以后其他对象需要同样的解密算法，重载这个方法就可以了。
     * @param student
     * @return
     * @throws Exception
     */
    public Student hotDecryptFields(Student student, String timestamp) throws Exception {
        for (Field field: Student.class.getDeclaredFields()) {
            if (field.getType() == String.class) {
                field.setAccessible(true);
                String encryptedValue = (String) field.get(student);
//                System.out.println("字段的值：" + encryptedValue);
                if (encryptedValue != null && !encryptedValue.isEmpty()) {
                    String decryptedValue = decrypt(encryptedValue, timestamp);
//                    System.out.println("解密后字段的值：" + encryptedValue);
                    field.set(student, decryptedValue);
                }
            }
        }
        return student;
    }

    // 生成16位秘钥
    public static String getKey(){
        String chars = "ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz1234567890";
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < 16; i++) {
            builder.append(chars.indexOf(new Random().nextInt(chars.length())));
        }
        return builder.toString();
    }
}
