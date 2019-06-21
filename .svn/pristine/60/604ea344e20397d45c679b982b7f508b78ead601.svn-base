package com.ybt.web.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import Decoder.BASE64Decoder;

import com.jiufengxinxi.core.entity.JsonResult;
import com.jiufengxinxi.utils.Logger;
import com.jiufengxinxi.utils.mapper.JsonMapper;


/** 接口参数校验
 * @author:	fh qq313596790[青苔]
 * 修改日期：2015/11/2
 */
public class AppUtil  {
	
	protected static Logger logger = Logger.getLogger(AppUtil.class);
	
	
	/**
	 * @param map
	 * @return
	 */
	public static Object returnObject(JsonResult jr){
		return JsonMapper.nonEmptyMapper().toJson(jr);
	}
	
	
	/**
	 * @Description: 将base64编码字符串转换为图片
	 * @Author: 
	 * @CreateTime: 
	 * @param imgStr base64编码字符串
	 * @param path 图片路径-具体到文件
	 * @return
	*/
	public static String generateImage(String imgStr,String basepath,String flord) {
	  if (imgStr == null)
	    return null;
	  if(imgStr.startsWith("data:image")){
		  imgStr=imgStr.substring(imgStr.indexOf("base64,")+7);
	  }
	  
	  SimpleDateFormat sdf=new SimpleDateFormat("/yyyy/MM/dd/");
  		flord=flord+sdf.format(new Date());
		String qrcodeFilePath = basepath+flord;
		String fileName=UUID.randomUUID()+".jpg";
	  BASE64Decoder decoder = new BASE64Decoder();
	  try {
		File file=new File(qrcodeFilePath);
      	if(!file.exists()){
      		file.mkdirs();
      	}
	    // 解密
	    byte[] b = decoder.decodeBuffer(imgStr);
	    // 处理数据
	    for (int i = 0; i < b.length; ++i) {
	      if (b[i] < 0) {
	        b[i] += 256;
	      }
	    }
	    OutputStream out = new FileOutputStream(qrcodeFilePath+fileName);
	    out.write(b);
	    out.flush();
	    out.close();
	    return flord+fileName;
	  } catch (Exception e) {
	    return null;
	  }
	}
	
}
