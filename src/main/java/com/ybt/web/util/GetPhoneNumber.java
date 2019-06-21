package com.ybt.web.util;

import java.util.Arrays;


import com.alibaba.fastjson.JSONObject;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.security.AlgorithmParameters;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.Security;
import java.security.spec.InvalidParameterSpecException;

public class GetPhoneNumber {

	
	public static void main(String[] args) {
	try {
		String a = decrypt("uyJn5f+XyznoNOl/XaDrZ8bewMl39In0RWcFwRi8YbUzEkaHU0VS8KtyWqYS+Gh/tLvAyq2FtRdqxxzFtT6jIjqYmCSvP7HdApNRL4zpcYK2QzRzUpP6989hLfLBCrR3bRpUYJiEYAbqjgjpLOwcQvYaZLBWOzeHTTbgMFCwnEw0EXwtKUciZJuFQilhEX4r41PdD3wdrS+GqkCKQOmclQ==","uH9frSuyEhBfP4a2cWmq/Q==","nW0e0EKIy+blvuIczu4DGg==");
		System.out.println(a);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	
	
	
	 public static String decrypt(String data, String key, String iv) throws Exception { 
//	    initialize(); 
	 
	    //被加密的数据 
	    byte[] dataByte = Base64.decodeBase64(data); 
	    //加密秘钥 
	    byte[] keyByte = Base64.decodeBase64(key); 
	    //偏移量 
	    byte[] ivByte = Base64.decodeBase64(iv); 
	 
	 
	    try { 
	    Security.addProvider(new BouncyCastleProvider());  
	    	
	    Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding"); 
	 
	      SecretKeySpec spec = new SecretKeySpec(keyByte, "AES"); 
	 
	      AlgorithmParameters parameters = AlgorithmParameters.getInstance("AES"); 
	      parameters.init(new IvParameterSpec(ivByte)); 
	 
	      cipher.init(Cipher.DECRYPT_MODE, spec, parameters);// 初始化 
	 
	      byte[] resultByte = cipher.doFinal(dataByte); 
	      if (null != resultByte && resultByte.length > 0) { 
	        String result = new String(resultByte,"utf-8");
	        return result;  
	      } 
	      return null; 
	    } catch (NoSuchAlgorithmException e) { 
	      e.printStackTrace(); 
	    } catch (NoSuchPaddingException e) { 
	      e.printStackTrace(); 
	    } catch (InvalidParameterSpecException e) { 
	      e.printStackTrace(); 
	    } catch (InvalidKeyException e) { 
	      e.printStackTrace(); 
	    } catch (InvalidAlgorithmParameterException e) { 
	      e.printStackTrace(); 
	    } catch (IllegalBlockSizeException e) { 
	      e.printStackTrace(); 
	    } catch (BadPaddingException e) { 
	      e.printStackTrace(); 
	    } /*catch (UnsupportedEncodingException e) { 
	      e.printStackTrace(); 
	    } */
	 
	    return null; 
	  } 
	
}
