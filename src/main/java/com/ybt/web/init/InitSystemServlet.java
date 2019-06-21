package com.ybt.web.init;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

@SuppressWarnings("serial")
public class InitSystemServlet extends GenericServlet {
	//private Log log = LogFactory.getLog(InitSystemServlet.class);

	@Override
	public void init() throws ServletException {
		InitSystemService.runInits(getServletContext());
		//初始化数据
		//ISetupSystemService setupSystemService = ServicesFactory.getBean("setupSystemService");
		//log.info("正在初始代数据请稍候.....");
		//setupSystemService.init();
		
		//初始化系统配置(整个应用系统只有一份)
		//ConfigSetup.initSystemConfig(getServletContext());
		//log.info("已初始化系统配置");
		// 注册转换器
		//log.info("已注册转换器：UtilDateConverter 与 new GenericEnumConverter(Gender.class)");

		// 初始化数据字典
		//ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		//DataDict.initialize();

		//初始化CompassUtils
		//String applicationRealPath = getServletContext().getRealPath("/"); // 返回的目录将以'/'结尾
		//CompassUtils.init(applicationRealPath);

		//List topicTypeList = DataDict.getList(DDConstants.TOPIC_TYPE);
		//getServletContext().setAttribute(WebConstants.APPLICATION_TOPIC_TYPE_LIST, topicTypeList);
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		throw new UnsupportedOperationException();
	}

}
