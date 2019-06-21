package com.ybt.web.dwr;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.FileNameMap;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.io.FileTransfer;
import org.springframework.stereotype.Component;

import com.jiufengxinxi.core.exception.BusinessException;

@Component
public class FileTransferAccess {

	private static FileNameMap fileNameMap = URLConnection.getFileNameMap();
	private static Map<String,String> imageType=new HashMap<String,String>();
	private static Map<String,String> commonCompressType=new HashMap<String,String>();
	private static Map<String,String> commonOfficeType=new HashMap<String,String>();
	{
		imageType.put(".jpeg", "true");
		imageType.put(".jpg", "true");
		imageType.put(".gif", "true");
		imageType.put(".png", "true");
		imageType.put(".bmp", "true");
		imageType.put("msg", "只支持.jpeg .jpg .gif .png .bmp等文件格式");
		imageType.put("size", String.valueOf(1024 * 1024 * 2));
		imageType.put("type", "图片");
		
		commonCompressType.put(".rar", "true");
		commonCompressType.put(".zip", "true");
		commonCompressType.put("msg", "只支持 .rar .zip 等文件格式");
		commonCompressType.put("size", String.valueOf(1024 * 1024 * 20));
		commonCompressType.put("type", "常用压缩文件");
		
		
		commonOfficeType.put(".dox", "true");
		commonOfficeType.put(".docx", "true");
		commonOfficeType.put(".xls", "true");
		commonOfficeType.put(".xlsx", "true");
		commonOfficeType.put(".ppt", "true");
		commonOfficeType.put(".pptx", "true");
		commonOfficeType.put(".pdf", "true");
		commonOfficeType.put("msg", "只支持  常用办公 .dox,.docx,.xls,.xlsx,.ppt,.pptx,.pdf 等文件");
		commonOfficeType.put("size", String.valueOf(1024 * 1024 * 20));
		commonOfficeType.put("type", "常用办公文件");
	}
	
	public JSONObject commonCompressUpload(FileTransfer fileTransfer,String oldFile) {  
		return toUpload(fileTransfer, commonCompressType, oldFile); 
    } 
	
	
	public JSONObject imageUpload(FileTransfer fileTransfer,String oldFile) {  
		 return toUpload(fileTransfer, imageType, oldFile);
    }
	
	public JSONObject commonOfficeUpload(FileTransfer fileTransfer,String oldFile) {  
		 return toUpload(fileTransfer, commonOfficeType, oldFile);
   }
	
	public FileTransfer downloadFile(String filePath,String fileName, HttpServletRequest request, HttpServletResponse response,ServletContext context) {  
		FileTransfer transfer=null;
		try{
			String realPath = context.getRealPath(filePath);  
	  
	        File file = null;  
	        FileInputStream fis = null;  
	        try {  
	            file = new File(realPath);  
	            fis = new FileInputStream(file);  
	            /*if(StringUtils.isEmpty(fileName)){
	            	fileName=filePath.substring(filePath.lastIndexOf("/"));
	            }*/
	            
	        } catch (FileNotFoundException e) {  
	            e.printStackTrace();  
	        }   
	        String ctype="";
	        if(filePath.toLowerCase().endsWith(".apk")){
	        	ctype="application/vnd.android";
	        }else{
	        	ctype=fileNameMap.getContentTypeFor(file.toString());
	        }
	        transfer=new FileTransfer(new String( fileName.getBytes("GBK"),"iso8859-1" ), "file://"+ctype, file.length(),fis);  
        //FileTransfer为DWR的一个接口。可以接受inputStream，inputStreamFactory和btye[]类型，相当的好用。  
        }catch (Exception e) {
			e.printStackTrace();
		}
		return transfer;
    }  
	
	
	
	private JSONObject toUpload(FileTransfer fileTransfer,Map<String,String> accept,String oldFile){
		JSONObject json=null;
        try { 
        	validateFile(fileTransfer, accept);
        	json=upload(fileTransfer, accept);
        	if(json.get("success").toString().equals("true")){
        		deleteOldFile(oldFile);
        	}
        }catch (BusinessException e) {  
        	e.printStackTrace();
        	json=new JSONObject();
        	json.put("success", false);
        	json.put("msg", e.getMessage());
        }
        return json; 
	}
	
	private JSONObject upload(FileTransfer fileTransfer,Map<String,String> accept){
		JSONObject json=new JSONObject();
		
        String newFileName = ""; // 新文件名  
 
        InputStream streamIn = null;  
        
        try { 
        	WebContext webContext = WebContextFactory.get();  
	        
	        String relaPath="/res/upload/"+new SimpleDateFormat("yyyy/MM/dd").format(new Date());
	        
	        String saveurl = webContext.getHttpServletRequest().getSession().getServletContext().getRealPath(relaPath);
	        File dir=new File(saveurl);
	        if(!dir.exists()){
	        	dir.mkdirs();
	        }
	        
            if (fileTransfer.getFilename() != null && !fileTransfer.getFilename().equals("")) {  
                String oldName = fileTransfer.getFilename();
                String ext = getExtension(oldName).toLowerCase();
                newFileName = UUID.randomUUID().toString().replace("-", "") +ext;  
                json.put("url", relaPath+"/"+newFileName);
                streamIn = fileTransfer.getInputStream();  
                FileUtils.copyInputStreamToFile(streamIn, new File(saveurl,newFileName));
                streamIn.close();  
                json.put("oldName", oldName);
                json.put("success", true);
            }  
            
        } catch (FileNotFoundException ex) {  
        	ex.printStackTrace();
        	json.put("success", false);
        	json.put("msg", accept.get("type")+"保存异常");
        } catch (IOException e) {  
        	e.printStackTrace();
        	json.put("success", false);
        	json.put("msg", accept.get("type")+"保存异常");
        }catch (Exception e) {  
        	e.printStackTrace();
        	json.put("success", false);
        	json.put("msg", accept.get("type")+"保存异常");
        } finally {  
            streamIn = null;
        } 
        return json;
	}
	
	
	private void validateFile(FileTransfer fileTransfer,Map<String,String> accept) throws BusinessException{
		long size = Long.parseLong(accept.get("size")); 
    	if(accept.get(getExtension(fileTransfer.getFilename()))==null){
    		throw new BusinessException(accept.get("msg")); 
    	}
    	if(fileTransfer.getSize() > size){  
        	throw new BusinessException("文件不能大于"+(size/1024/1024)+"M");
        }
	}
	
	private void deleteOldFile(String oldFilePath){
		if(StringUtils.isNotEmpty(oldFilePath)){
			WebContext webContext = WebContextFactory.get();  
			String oldFileUrl = webContext.getHttpServletRequest().getSession().getServletContext().getRealPath(oldFilePath);
			File oldFile=new File(oldFileUrl);
			if(oldFile.exists()){
				oldFile.delete();
			}
		}
	}
	
	private String getExtension(String fileName) {
        return fileName.substring(fileName.lastIndexOf("."));
    }
	
}
