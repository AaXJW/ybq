package com.ybt.web.controller.ybq;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.directwebremoting.json.types.JsonObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ybt.base.entity.Hollander;
import com.ybt.base.service.IHollanderService;
import com.ybt.base.service.impl.HollanderService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/problem/")
public class ProblemController {
	
	@Resource
	private IHollanderService hollanderService;

	@RequestMapping(value = "addProblem")
	public ModelAndView addProblem() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manager/problem/addProblem");
		return mv;
	}
	
	@RequestMapping(value="save")
	public ModelAndView save(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		Hollander hollander = new Hollander();
		hollander.setProblem(request.getParameter("problem"));
		hollander.setNumber(Integer.parseInt(request.getParameter("number")));
		hollanderService.save(hollander);
		mv.setViewName("manager/problem/addProblem");
		return mv;
	}
	
	@RequestMapping(value="allProblem")
	public void getAllProblem(HttpServletRequest request, HttpServletResponse response){
		
		List<Hollander> list = hollanderService.findAll();
		
		String ss = null;
		if(list.size()>0){
			StringBuffer str = new StringBuffer();
			str.append("{\"data\":\"");
			for(int i=0;i<list.size();i++){
				str.append(list.get(i).getNumber());
				str.append(":");
				str.append(list.get(i).getProblem());
				str.append("|");
			}	
			ss = str.substring(0,str.length()-1)+"\"}";
			
		}else{
			ss = "{\"data\":当前无测试题}";
		}
		try {
			response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
			response.setCharacterEncoding("utf-8");
	/*		response.setContentType("text/plain");
			response.setCharacterEncoding("GB2312");*/	
			Gson gson = new Gson();
			String json = gson.toJson(ss);
			PrintWriter out = new PrintWriter(response.getOutputStream());
			out.print(ss);
			out.flush();
			System.out.println("发送报文："+ss);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
