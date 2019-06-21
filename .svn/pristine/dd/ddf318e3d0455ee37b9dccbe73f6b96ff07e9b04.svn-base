package com.ybt.base.utill;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileCommons {

	public static void dirExistOp(String path){
		File file=new File(path);
		if(!file.exists()){
			file.mkdirs();
		}
	}
	
	public static String createDateDirByFormat(String path,String format){
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		String newPath=path+"/"+sdf.format(new Date());
		dirExistOp(System.getProperty("ybt.root") + "/"+newPath);
		return newPath;
	}
	
	public static String createDateDirByFormat(String path){
		return createDateDirByFormat(path,"yyyy/MM/dd/HH");
	}
}
