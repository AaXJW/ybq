package com.ybt.web.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TreeMap;
import java.util.regex.Pattern;
import java.util.zip.GZIPOutputStream;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.jiufengxinxi.utils.Encodes;

/**
 * WEB应用程序常用工具集合
 * @author cjh
 */
public class WebAppUtils {
	private static ThreadLocal<HttpServletRequest> currentLocalThread = new ThreadLocal<HttpServletRequest>();
	//-- Content Type 定义 --//
	public static final String TEXT_TYPE = "text/plain";
	public static final String JSON_TYPE = "application/json";
	public static final String XML_TYPE = "text/xml";
	public static final String HTML_TYPE = "text/html";
	public static final String JS_TYPE = "text/javascript";
	public static final String EXCEL_TYPE = "application/vnd.ms-excel";

	//-- Header 定义 --//
	public static final String AUTHENTICATION_HEADER = "Authorization";

	//-- 常用数值定义 --//
	public static final long ONE_YEAR_SECONDS = 60 * 60 * 24 * 365;
	
	/**
	 * 获取应用程序的包含端口访问URL地址
	 * @param request
	 * @return 应用程序的访问地址，如 http://localhost:8080/dzwzwg/
	 */
	public static String getBaseAccessUrl(HttpServletRequest request) {
		String basePath = request.getScheme() + "://" + request.getServerName() + (request.getServerPort()==80?"":(":" + request.getServerPort())) + request.getContextPath() + "/";
		return basePath;
	}

	/**
	 * 获取应用程序的不包含端口访问URL地址
	 * @param request
	 * @return 应用程序的访问地址（不含端口号，因为发布后要使用80端口，即不用指定），如 http://localhost/dzwzwg/
	 */
	public static String getBaseAccessUrlWithoutPort(HttpServletRequest request) {
		/*
		String path = request.getContextPath();
		// 如果是，就应如下：
		if ("/".equals(path)) {
			path = ""; // 就忽略他
		}
		*/
		// FIXME 把应用放到ROOT下时，path是否为'/'?!
		int port = request.getServerPort();
		String basePath = request.getScheme() + "://" + request.getServerName() + 
				((port != 80||port!=443)?(":" + port):"")+
				(request.getContextPath().equals("/")?"":request.getContextPath());
		return basePath;
	}

	/**
	 * 获取应用程序真实路径地址
	 * @param request
	 * @return 应用程序的真实路径地址，如 d:\webapps\dzwzwg\ 或 /var/www/dzwzwg
	 */
	public static String getBaseRealPath(HttpServletRequest request) {
		// 1，如果传递""或"/"，得到的路径包含最后的'/'。
		// 2，如果传递一个子路径"/aa"或"/aa/"或"aa"或"aa/"。得到的为"/www/dzwzwg/aa"，得到的路径没有最后的'/'。
		String realPath = request.getSession().getServletContext().getRealPath("/");
		return realPath;
	}
	
	
    /***
     * 获取URI的路径,如路径为http://www.dzwzwg.com/action/post.htm?id=123456, 得到的值为"/action/post.htm"
     * @param request
     * @return
     */
    public static String getRequestURI(HttpServletRequest request){     
        return request.getRequestURI();
    }
    /**
     * 获取完整请求路径(含内容路径及请求参数)
     * @param request
     * @return
     */
    public static String getRequestURIWithParam(HttpServletRequest request){     
        return getRequestURI(request) + (request.getQueryString() == null ? "" : "?"+ request.getQueryString());
    }
    
    /**
     * 添加cookie
     * @param response
     * @param domain cookie的域名
     * @param path cookie的路径
     * @param name cookie的名称
     * @param value cookie的值
     * @param maxAge cookie存放的时间(以秒为单位,假如存放三天,即3*24*60*60; 如果值为0,cookie将随浏览器关闭而清除)
     */
    public static void addCookie(HttpServletResponse response, String domain,String path,String name, String value, int maxAge,boolean httpOnly) {        
        Cookie cookie;
		try {
			cookie = new Cookie(name, URLEncoder.encode(value, "UTF-8"));
	        if(StringUtils.isNotBlank(domain)){
	        	cookie.setDomain(domain);
	        }
	        if(StringUtils.isNotBlank(path)){
	            cookie.setPath(path);
	        }else{
	        	cookie.setPath("/");
	        }
	        /*if(httpOnly)
	        	cookie.setHttpOnly(true);*/
	        if (maxAge>0) cookie.setMaxAge(maxAge);
	        response.addCookie(cookie);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

    }
   
    /**
     * 添加cookie
     * @param response
     * @param domain cookie的域名
     * @param path cookie的路径
     * @param name cookie的名称
     * @param value cookie的值
     * @param maxAge cookie存放的时间(以秒为单位,假如存放三天,即3*24*60*60; 如果值为0,cookie将随浏览器关闭而清除)
     */
    public static void addCookie(HttpServletResponse response, String domain,String path,String name, String value, int maxAge) {        
    	addCookie(response,domain,path,name,value,maxAge,false);
    }
   
    
    /**
     * 添加cookie
     * @param response
     * @param name cookie的名称
     * @param value cookie的值
     * @param maxAge cookie存放的时间(以秒为单位,假如存放三天,即3*24*60*60; 如果值为0,cookie将随浏览器关闭而清除)
     */
    public static void addCookie(HttpServletResponse response,String name, String value, int maxAge)  {        
    	addCookie(response,null,null,name,value,maxAge);
    }
    
    
    /**
     * 删除cookie
     * @param response
     * @param name cookie的名称
     */
    public static void removeCookie(HttpServletResponse response,String name){
        Cookie cookie = new Cookie(name, null);
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }
    
    /**
     * 获取cookie的值
     * @param request
     * @param name cookie的名称
     * @return
     */
    public static String getCookieByName(HttpServletRequest request, String name) {
    	Map<String, Cookie> cookieMap = WebAppUtils.readCookieMap(request);
        if(cookieMap.containsKey(name)){
            Cookie cookie = (Cookie)cookieMap.get(name);
            try {
				return URLDecoder.decode(cookie.getValue(), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				return null;
			}
        }else{
            return null;
        }
    }
    
    /**
     * 
     * @param request
     * @return
     */
    protected static Map<String, Cookie> readCookieMap(HttpServletRequest request) {
        Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
        Cookie[] cookies = request.getCookies();
        if (null != cookies) {
            for (int i = 0; i < cookies.length; i++) {
                cookieMap.put(cookies[i].getName(), cookies[i]);
            }
        }
        return cookieMap;
    }
    
    /**
     * 去除html代码
     * @param inputString
     * @return
     */
    public static String HtmlToText(String inputString) {
        String htmlStr = inputString; //含html标签的字符串
        String textStr ="";
        java.util.regex.Pattern p_script;
        java.util.regex.Matcher m_script;
        java.util.regex.Pattern p_style;
        java.util.regex.Matcher m_style;
        java.util.regex.Pattern p_html;
        java.util.regex.Matcher m_html;          
        java.util.regex.Pattern p_ba;
        java.util.regex.Matcher m_ba;
        
        try {
            String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; //定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script> }
            String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; //定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style> }
            String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式
            String patternStr = "\\s+";
            
            p_script = Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE);
            m_script = p_script.matcher(htmlStr);
            htmlStr = m_script.replaceAll(""); //过滤script标签

            p_style = Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE);
            m_style = p_style.matcher(htmlStr);
            htmlStr = m_style.replaceAll(""); //过滤style标签
         
            p_html = Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE);
            m_html = p_html.matcher(htmlStr);
            htmlStr = m_html.replaceAll(""); //过滤html标签
            
            p_ba = Pattern.compile(patternStr,Pattern.CASE_INSENSITIVE);
            m_ba = p_ba.matcher(htmlStr);
            htmlStr = m_ba.replaceAll(""); //过滤空格
         
         textStr = htmlStr;
         
        }catch(Exception e) {
                    System.err.println("Html2Text: " + e.getMessage());
        }          
        return textStr;//返回文本字符串
     }
    
    
    /**
     * 设置客户端缓存过期时间 Header.
     * @param response
     * @param expiresSeconds 多少秒过期
     */
	public static void setExpiresHeader(HttpServletResponse response, long expiresSeconds) {
		//Http 1.0 header
		response.setDateHeader("Expires", System.currentTimeMillis() + expiresSeconds * 1000);
		//Http 1.1 header
		response.setHeader("Cache-Control", "max-age=" + expiresSeconds);
	}

	/**
	 * 设置客户端无缓存Header.
	 * @param response
	 */
	public static void setNoCacheHeader(HttpServletResponse response) {
		//Http 1.0 header
		response.setDateHeader("Expires", 0);
		//Http 1.1 header
		response.setHeader("Cache-Control", "no-cache");
	}

	/**
	 * 设置LastModified Header.(服务器上文件的最后修改时间)
	 * @param response
	 * @param lastModifiedDate
	 */
	public static void setLastModifiedHeader(HttpServletResponse response, long lastModifiedDate) {
		response.setDateHeader("Last-Modified", lastModifiedDate);
	}

	/**
	 * 设置Etag Header.(文件标识)
	 */
	public static void setEtag(HttpServletResponse response, String etag) {
		response.setHeader("ETag", etag);
	}

	/**
	 * 根据浏览器If-Modified-Since Header, 计算文件是否已被修改.
	 * 
	 * 如果无修改, checkIfModify返回false ,设置304 not modify status.
	 * 
	 * @param lastModified 内容的最后修改时间.
	 */
	public static boolean checkIfModifiedSince(HttpServletRequest request, HttpServletResponse response,
			long lastModified) {
		long ifModifiedSince = request.getDateHeader("If-Modified-Since");
		if ((ifModifiedSince != -1) && (lastModified < ifModifiedSince + 1000)) {
			response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
			return false;
		}
		return true;
	}

	/**
	 * 根据浏览器 If-None-Match Header, 计算Etag是否已无效.
	 * 
	 * 如果Etag有效, checkIfNoneMatch返回false, 设置304 not modify status.
	 * 
	 * @param etag 内容的ETag.
	 */
	public static boolean checkIfNoneMatchEtag(HttpServletRequest request, HttpServletResponse response, String etag) {
		String headerValue = request.getHeader("If-None-Match");
		if (headerValue != null) {
			boolean conditionSatisfied = false;
			if (!"*".equals(headerValue)) {
				StringTokenizer commaTokenizer = new StringTokenizer(headerValue, ",");

				while (!conditionSatisfied && commaTokenizer.hasMoreTokens()) {
					String currentToken = commaTokenizer.nextToken();
					if (currentToken.trim().equals(etag)) {
						conditionSatisfied = true;
					}
				}
			} else {
				conditionSatisfied = true;
			}

			if (conditionSatisfied) {
				response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
				response.setHeader("ETag", etag);
				return false;
			}
		}
		return true;
	}

	/**
	 * 检查浏览器客户端是否支持gzip编码.
	 * @param request
	 * @return
	 */
	public static boolean checkAccetptGzip(HttpServletRequest request) {
		//Http1.1 header
		String acceptEncoding = request.getHeader("Accept-Encoding");

		if (StringUtils.contains(acceptEncoding, "gzip")) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 设置Gzip Header并返回GZIPOutputStream.
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public static OutputStream buildGzipOutputStream(HttpServletResponse response) throws IOException {
		response.setHeader("Content-Encoding", "gzip");
		response.setHeader("Vary", "Accept-Encoding");
		return new GZIPOutputStream(response.getOutputStream());
	}

	/**
	 * 设置让浏览器弹出下载对话框的Header.
	 * @param response
	 * @param fileName 下载后的文件名.
	 */
	public static void setFileDownloadHeader(HttpServletResponse response, String fileName) {
		try {
			//中文文件名支持
			String encodedfileName = new String(fileName.getBytes(), "ISO8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedfileName + "\"");
		} catch (UnsupportedEncodingException e) {
		}
	}

	/**
	 * 打开文件
	 * @param response
	 * @param fileName
	 * @param ins
	 * @throws IOException
	 */
	public static void viewFile(final HttpServletResponse response, final String fileName, final FileInputStream ins) throws IOException{
		WebAppUtils.setNoCacheHeader(response);
		OutputStream outs = response.getOutputStream();
		byte buffer[] = new byte[1024];
		int ilen = 0;
		while((ilen = ins.read(buffer)) != -1){
		    outs.write(buffer, 0, ilen);
		 }
		 if(outs!=null){
			 outs.flush();
		 }
		 if(ins!=null){
			 ins.close();
		 }
	}
	
	/**
	 * 下载文件
	 * @param response
	 * @param fileName
	 * @param ins
	 * @throws IOException
	 */
	public static void downloadFile(final HttpServletResponse response, final String fileName, final FileInputStream ins) throws IOException{
		WebAppUtils.setFileDownloadHeader(response, fileName);
		viewFile(response,fileName, ins);
	}
	/**
	 * 取得带相同前缀的Request Parameters.
	 * 
	 * 返回的结果Parameter名已去除前缀.
	 */
	public static Map<String, String> getParametersStartingWith(HttpServletRequest request, String prefix) {
		//return org.springframework.web.util.WebUtils.getParametersStartingWith(request, prefix);
		Enumeration paramNames = request.getParameterNames();
		Map params = new TreeMap();
		if (prefix == null) {
			prefix = "";
		}
		while (paramNames != null && paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();
			if ("".equals(prefix) || paramName.startsWith(prefix)) {
				String unprefixed = paramName.substring(prefix.length());
				String[] values = request.getParameterValues(paramName);
				if (values == null || values.length == 0) {//NOSONAR
					// Do nothing, no values found at all.
				} else if (values.length > 1) {
					params.put(unprefixed, values);
				} else {
					params.put(unprefixed, values[0]);
				}
			}
		}
		return params;
	}
	
	/**
	 * 对Http Basic验证的 Header进行编码.
	 * @param userName
	 * @param password
	 * @return
	 */
	public static String encodeHttpBasic(String userName, String password) {
		String encode = userName + ":" + password;
		return "Basic " + Encodes.encodeBase64(encode.getBytes());
	}
	
	/**
	 * 保存request到当前线程
	 * @param request
	 */
	public static void putRequest(HttpServletRequest request){
		currentLocalThread.set(request);
	}
	
	/**
	 * 删除当前线程request
	 */
	public static void removeRequest(){
		currentLocalThread.remove();
	}
	
	/**
	 * 获取当前线程reqest
	 * @return
	 */
	public static HttpServletRequest getRequest(){
		return currentLocalThread.get();
	}
	
	
}
