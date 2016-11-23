package net.sunniwell.pas.util;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * 加密工具类
 *
 * @author zhoudeming
 * @date 2016/11/10
 */
public class EncryptUtil {

    public static final String KEY_SHA = "SHA";
    public static final String KEY_MD5 = "MD5";

    /**
     * MAC算法可选以下多种算法
     * <p>
     * <pre>
     * HmacMD5
     * HmacSHA1
     * HmacSHA256
     * HmacSHA384
     * HmacSHA512
     * </pre>
     */
    public static final String KEY_MAC = "HmacMD5";

    /**
     * BASE64解密
     *
     * @param data 加密数据
     * @return 加密后字符串
     * @throws Exception
     */
    public static byte[] decryptByBASE64(String data) throws Exception {
        return (new BASE64Decoder()).decodeBuffer(data);
    }

    /**
     * BASE64加密
     *
     * @param data 加密数据
     * @return 加密后字符串
     * @throws Exception
     */
    public static String encryptByBASE64(byte[] data) throws Exception {
        return (new BASE64Encoder()).encodeBuffer(data);
    }

    /**
     * MD5加密
     *
     * @param data 加密数据
     * @return 加密后字符串
     * @throws Exception
     */
    public static String encryptByMD5(byte[] data) throws Exception {
        MessageDigest md5 = MessageDigest.getInstance(KEY_MD5);
        md5.update(data);
        return new BigInteger(md5.digest()).toString(16);

    }

    /**
     * SHA加密
     *
     * @param data 加密数据
     * @return 加密后字符串
     * @throws Exception
     */
    public static String encryptBySHA(byte[] data) throws Exception {
        MessageDigest sha = MessageDigest.getInstance(KEY_SHA);
        sha.update(data);
        return new BigInteger(sha.digest()).toString(32);

    }

    /**
     * 初始化HMAC密钥
     *
     * @return 密钥
     * @throws Exception
     */
    public static String initMacKey() throws Exception {
        KeyGenerator keyGenerator = KeyGenerator.getInstance(KEY_MAC);
        SecretKey secretKey = keyGenerator.generateKey();
        return encryptByBASE64(secretKey.getEncoded());
    }

    /**
     * HMAC加密
     *
     * @param data 加密数据
     * @param key  密钥
     * @return 加密后字符串
     * @throws Exception
     */
    public static String encryptHMAC(byte[] data, String key) throws Exception {
        SecretKey secretKey = new SecretKeySpec(decryptByBASE64(key), KEY_MAC);
        Mac mac = Mac.getInstance(secretKey.getAlgorithm());
        mac.init(secretKey);
        return new BigInteger(mac.doFinal(data)).toString(16);
    }
}
