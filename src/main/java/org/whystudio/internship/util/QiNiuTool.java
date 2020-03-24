package org.whystudio.internship.util;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.BatchStatus;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

/**
 * 七牛云工具
 */
public class QiNiuTool {
    private static final Logger logger = LoggerFactory.getLogger(QiNiuTool.class);

//    static String ACCESS_KEY = "ifgB2xsTb2EQ94gIS5wI3QRkuY7uLhQ1Sv0SrEam";
//    static String SECRET_KEY = "1QeBhytnwcwoJch4FJofE05usczEj6G4PmhKKtLg";
//    static String BUCKET_NAME = "public";
//    static String DNS = "image.ruankun.xyz";
    private static String ACCESS_KEY;
    private static String SECRET_KEY;
    private static String BUCKET_NAME;
    private static String DNS;

    /**
     * 加载七牛云配置工具
     */
    static{
        Properties properties = new Properties();
        InputStream inputStream = QiNiuTool.class.getClassLoader()
                .getResourceAsStream("application.properties");
        try {
            properties.load(inputStream);
            ACCESS_KEY = properties.getProperty("ACCESS_KEY");
            SECRET_KEY = properties.getProperty("SECRET_KEY");
            BUCKET_NAME = properties.getProperty("BUCKET_NAME");
            DNS = properties.getProperty("DNS");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    static Boolean loadQiNiu() {
        return null;
    }

    /**
     * 上传文件工具
     * @param file
     * @param key
     * @return
     */
    public static String uploadQiNiu(InputStream file, String key) {
        if (null == file) {
            logger.info("文件流为空");
            return null;
        }

        // 构造一个带指定Zone对象的配置类
        //Configuration cfg = new Configuration(Zone.zone0());
        Configuration cfg = new Configuration(Region.region0());
        // 生成上传凭证，然后准备上传
        UploadManager uploadManager = new UploadManager(cfg);

        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        //加入token参数
        String token = auth.uploadToken(BUCKET_NAME);

        try {
            Response response = uploadManager.put(file, key, token, null, null);
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            //System.out.println("PutKey: " + putRet.key);
            ///System.out.println("PutHash: " + putRet.hash);
            //返回的url路径名称
            return DNS + "/" + putRet.key;
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("请求错误");
        }
        return null;
    }

    public static String uploadQiNiu(MultipartFile file) {
        InputStream inputStream = null;
        try {
            inputStream = file.getInputStream();
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("获取文件流失败");
        }
        //获取url
        String url = uploadQiNiu(inputStream, MD5Tool.md5(new Date().toString()));
        return url;
    }

    /**
     * 获取文件后缀名
     * @param file
     * @return
     */
    public static String getFileType(MultipartFile file) {
        String type = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        System.out.println(type);
        return type;
    }

    /**
     * 在七牛云上删除文件
     * @param key such as happy.jpg
     * @return
     */
    public static Boolean deleteQiNiuFile(String key) {
        //构造一个带指定 Region 对象的配置类
        Configuration cfg = new Configuration(Region.region0());
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            bucketManager.delete(BUCKET_NAME, key);
            //删除成功
            return true;
        } catch (QiniuException ex) {
            //如果遇到异常，说明删除失败
            System.err.println(ex.code());
            System.err.println(ex.response.toString());
        }
        return false;
    }

    /**
     * 批量删除文件
     * @param keys 文件名列表
     * @return
     */
    public static List<String> deleteQiNiuFileBatch(String[] keys) {
        Configuration cfg = new Configuration(Region.region0());
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            BucketManager.BatchOperations batchOperations = new BucketManager.BatchOperations();
            batchOperations.addDeleteOp(BUCKET_NAME, keys);
            Response response = bucketManager.batch(batchOperations);
            BatchStatus[] batchStatusList = response.jsonToObject(BatchStatus[].class);
            List<String> rs = new ArrayList<>();

            for (int i = 0; i < keys.length; i++) {
                StringBuilder s = new StringBuilder();
                BatchStatus status = batchStatusList[i];
                String key = keys[i];
                s.append(key);
                s.append("\t");
                if (status.code == 200) {
                    s.append("delete success");
                } else {
                    s.append(status.data.error);
                }
                rs.add(s.toString());
            }
            return rs;
        } catch (QiniuException e) {
            e.printStackTrace();
            return null;
        }
    }
    /**
     * 解析出key的工具
     * @param url
     * @return
     */
    public static String urlTokey(String url) {
        //url = dns➕key
        //在七牛云中删除需要使用到key，将key分离;
        String key = url.replace(DNS + "/", "");
        return key;
    }
}
