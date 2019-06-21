package com.ybt.web.controller.ybq;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ybt.base.entity.Test;
import com.ybt.base.service.ITestService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value = "/Test/")
public class TestController {

@Resource
private ITestService testService;
	
	
public static final String FIXEDPATH = "https://www.yibaiqian100.com/photo/static/img/";

@RequestMapping(value = "addTest")
public ModelAndView addTest(){
	ModelAndView mv = new ModelAndView();
	mv.setViewName("manager/test/addTest");
	return mv;
}


	
@RequestMapping(value = "getAllTest")
public void getAllTest(HttpServletRequest request, HttpServletResponse response){
	List<Test> list = testService.findAll();
	String result = "";
	PrintWriter out;
	try {
		
		response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		/*response.setContentType("text/plain");
		response.setCharacterEncoding("GB2312");*/
		
		out = new PrintWriter(response.getOutputStream());
		if (list == null || list.size() == 0) {
			result = "当前无数据";
			out.print(result);
		} else {
			JSONArray listObject = JSONArray.fromObject(list);
			out.print(listObject);
			out.flush();
			System.out.println("发送报文：" + listObject);
		}

	} catch (IOException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}

}
	
	
@RequestMapping(value = "save")
public ModelAndView save(HttpServletRequest request, HttpServletResponse response,@RequestParam("imagePath") MultipartFile myFile){
	
	System.out.println("开始进行存储");
	
	String synopsis = request.getParameter("synopsis");
	
	String price = request.getParameter("price");
	
	
	String teseName = request.getParameter("teseName");
	ModelAndView mv = new ModelAndView();
	
	try {
		// 输出文件后缀名称
		System.out.println(myFile.getOriginalFilename());
		// 图片名称
		String name = myFile.getOriginalFilename();
		if (name != null && !"".endsWith(name)) {
			String url = request.getSession().getServletContext().getRealPath("/static/img/");
			// 相对路径
			String path = "/" + name;
			File file = new File(url);
			if (!file.exists()) {
				file.mkdirs();
			}
			myFile.transferTo(new File(url + path));
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	String imagePath = FIXEDPATH + myFile.getOriginalFilename();

	Test test = new Test();
	
	test.setSynopsis(synopsis);
	test.setPrice(Double.parseDouble(price));
	test.setTeseName(teseName);
	test.setImagePath(imagePath);
	
	testService.save(test);
	mv.setViewName("manager/test/addTest");
	 return mv;
}
	
}
	
	
