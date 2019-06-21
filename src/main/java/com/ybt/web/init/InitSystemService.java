package com.ybt.web.init;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 系统初始化服务
 * @author cjh
 *
 */
public class InitSystemService /**implements ServletContextAware*/{
	private static Log log = LogFactory.getLog(InitSystemService.class);
	private static ServletContext sc;
	private static Map<String,IAppInitAware> initMaps = new HashMap<String, IAppInitAware>();
	public void setLists(List<IAppInitAware> lists) {
		if(lists!=null){
			for(IAppInitAware appInitService:lists){
				initMaps.put(appInitService.getClass().getName(), appInitService);
			}
		}
    }
	/**
	public void setServletContext(ServletContext servletContext) {
		sc = servletContext;
	}*/

	/**
	 * 获取ServletContext
	 * @return
	 */
	public static ServletContext getServletContext(){
		return sc;
	}
	/**
	 * 执行初始化
	 */
	public static void runInits(ServletContext servletContext){
		sc = servletContext;
		for(IAppInitAware appInitService:initMaps.values()){
			runInit(appInitService);
			//appInitService.run(sc);
		}
	}
	/**
	 * 初始化指定IAppInitAware的实现类
	 * @param appInitService IAppInitAware的实现类
	 */
	public static void runInit(IAppInitAware appInitAware){
		if(appInitAware!=null&&!appInitAware.getClass().isInterface()){
			log.info(appInitAware.getClass().getName()+"-->执行初始化");
			initMaps.get(appInitAware.getClass().getName()).run(sc);
		}
	}
}
