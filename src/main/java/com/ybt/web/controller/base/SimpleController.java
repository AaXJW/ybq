package com.ybt.web.controller.base;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jiufengxinxi.utils.Assert;
import com.jiufengxinxi.utils.BeanValidators;
import com.jiufengxinxi.utils.Reflections;
import com.jiufengxinxi.utils.mapper.JsonMapper;
import com.ybt.web.util.Constants;

public abstract class SimpleController {

	protected final Logger logger = LoggerFactory.getLogger(getClass());
	protected final int BUFFER_SIZE = 16 * 1024;
	
	/**
	 * 成功变量名称
	 */
	public static final String SUCCESS = "success";
	
	/**
	 * 失败变量名称
	 */
	public static final String FAILURE = "failure";
	
	
	/**
	 * 实体变量名称
	 */
	public static final String ENTITY_ATTRIBUTE_NAME = "entity";
	/**
	 * 提示信息变量名称
	 */
	public static final String MESSAGE_NAME = "message";
	/**
	 * 错误提示信息变量名称
	 */
	public static final String ERRORS_NAME = "errors";
	
	/**
	 * 重定向标记(客户端行为)
	 */
	public static final String REDIRECT = "redirect:";
	/**
	 * //转发标记(服务器行为)
	 */
	public static final String FORWARD = "forward:";

	/**
	 * json 工具
	 */
	protected static JsonMapper jsonMapper = new JsonMapper();
	
	/**
	 * 实体数据验证组件
	 */
	@Autowired
	protected LocalValidatorFactoryBean validator;
	
	/**
	 * 数据转换组件
	 */
	@Autowired
	protected ConversionService conversionService;
	
	
	/**
	 * 获取默认的返回URL(用于子类重写)【不包含"redirect:"】；
	 * 如果子类不重写，默认返回null
	 * @return
	 */
	public String getDefaultRedirectReturnUrl(){
		return null;
	}
	
	/**--------------- file Upload  ----------------**/
	/**
	 * 判断是否有上传文件
	 * @param request
	 * @return
	 */
	protected boolean isExistUpload(HttpServletRequest request) {
		if(request instanceof MultipartHttpServletRequest){
			MultipartHttpServletRequest mhr = (MultipartHttpServletRequest)request;
			if(mhr.getFileMap().size()>1){
				Iterator<String> fileNames=mhr.getFileNames();
				while(fileNames.hasNext()){
					if(mhr.getFile(fileNames.next()).getSize()>0){
						return true;
					}
				}
			}else if(mhr.getFileMap().size()==1){
				return mhr.getFile(mhr.getFileNames().next()).getSize()>0?true:false;
			}else{
				return false;
			}
			return mhr.getFileMap().size()>0&&mhr.getFileNames().next()!=null?true:false;
		}
		return false;
	}
	
	
	/**
	 * 复制文件
	 * @param srcFile
	 * @param dest
	 */
	protected void copyFile(final File srcFile, final File dest) {
		InputStream in = null;
		OutputStream out = null;
		try {
			in = new BufferedInputStream(new FileInputStream(srcFile), BUFFER_SIZE);
			out = new BufferedOutputStream(new FileOutputStream(dest),BUFFER_SIZE);
			byte[] buffer = new byte[BUFFER_SIZE];
			int len = 0;
			while ((len = in.read(buffer)) > 0){
				out.write(buffer, 0, len);
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			if (null != in){
				try {
					in.close();
				} catch (IOException e){
					e.printStackTrace();
				}
			}
			if (null != out) {
				try {
					out.close(); 
				} catch (IOException e){
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 写入文件
	 * @param srcFile
	 * @param dest
	 */
	protected void writeFile(final InputStream in, final File dest) {
		OutputStream out = null;
		try {
			File parent=dest.getParentFile();
			if(!parent.exists()){
				parent.mkdirs();
			}
			//in = new BufferedInputStream(in, BUFFER_SIZE);
			out = new BufferedOutputStream(new FileOutputStream(dest),BUFFER_SIZE);
			byte[] buffer = new byte[BUFFER_SIZE];
			int len = 0;
			while ((len = in.read(buffer)) > 0){
				out.write(buffer, 0, len);
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			if (null != in){
				try {
					in.close();
				} catch (IOException e){
					e.printStackTrace();
				}
			}
			if (null != out) {
				try {
					out.close(); 
				} catch (IOException e){
					e.printStackTrace();
				}
			}
		}
	}

	
    /**
     * 初始化在邦定类型转换
     * @param wdb
     */
	@InitBinder
	public void initBinder(WebDataBinder wdb) {
		//wdb.setValidator(validator);
		//b.registerCustomEditor(List.class, "groupList", groupListEditor);
		//wdb.registerCustomEditor(Date.class,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),true));
		//wdb.registerCustomEditor(Date.class,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm"),true));
		//wdb.registerCustomEditor(Date.class,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
		//wdb.registerCustomEditor(Date.class,new CustomDateEditor(new SimpleDateFormat("yyyy/MM/dd"),true));
		//wdb.registerCustomEditor(Date.class,new CustomDateEditor(new SimpleDateFormat("dd/MM/yyyy"),true));
	}
	
	/**
	 * 校验实体数据
	 * @param entity
	 * @throws ConstraintViolationException
	 */
	protected void validate(Object entity) throws ConstraintViolationException{
		BeanValidators.validateWithException(validator.getValidator(), entity);
	}
	
	
	
	protected String dateFilePathGenerate(String base,String ext){
		//String basePath=WebAppUtils.getBaseRealPath(getRequest());
		SimpleDateFormat sdf=new SimpleDateFormat("/yyyy/MM/dd/");
		base=base+sdf.format(new Date());
		//String qrcodeFilePath = basePath+base;
		String fileName=UUID.randomUUID().toString().replace("-", "")+ext;
		return base+fileName;
	}
}
