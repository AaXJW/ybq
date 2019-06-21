package com.ybt.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

import com.ybt.base.entity.vo.LoInfo;

import net.sf.json.JSONObject;



public class SendGet {

	private static final String APPID = "appid=wx6708accb359f41d9";
	
	private static final String SECRET = "secret=acae7e59ef54bef6a8142dd868be55ac";
	
	private static final String GRANT_TYPE = "grant_type=authorization_code";
	
	private static final String URL = "https://api.weixin.qq.com/sns/jscode2session";
	
	public static String SendGET(String jsCode   ){
		   String result="";//访问返回结果
		   BufferedReader read=null;//读取访问结果
		    
		   try {
		    //创建url
		    URL realurl=new URL(URL+"?"+APPID+"&"+SECRET+"&js_code="+jsCode+"&"+GRANT_TYPE);
		    //打开连接
		    URLConnection connection=realurl.openConnection();
		     // 设置通用的请求属性
		             connection.setRequestProperty("accept", "*/*");
		             connection.setRequestProperty("connection", "Keep-Alive");
		             connection.setRequestProperty("user-agent",
		                     "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
		             //建立连接
		             connection.connect();
		          // 获取所有响应头字段
		             Map<String, List<String>> map = connection.getHeaderFields();
		             // 遍历所有的响应头字段，获取到cookies等
		             for (String key : map.keySet()) {
		                 System.out.println(key + "--->" + map.get(key));
		             }
		             // 定义 BufferedReader输入流来读取URL的响应
		             read = new BufferedReader(new InputStreamReader(
		                     connection.getInputStream(),"UTF-8"));
		             String line;//循环读取
		             while ((line = read.readLine()) != null) {
		                 result += line;
		             }
		   } catch (IOException e) {
		    e.printStackTrace();
		   	}finally{
		    if(read!=null){//关闭流
		     try {
		      read.close();
		     } catch (IOException e) {
		      e.printStackTrace();
		     }
		    }
		   }
		     
		   return result; 
		 }
	
	
	public static void main(String[] args) {
		
	String cs =	SendGET("023fRVLR1aFyN21yQDLR1GB3MR1fRVLl");
	
	JSONObject js = JSONObject.fromObject(cs);
	
	LoInfo  loinfo = (LoInfo) JSONObject.toBean(js, LoInfo.class);
		System.out.println(loinfo.getOpenid());
		System.out.println(loinfo.getSession_key());
		
		
	}
	
	
	
	
	
}
