package com.ybt.web.controller.ybq;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ybt.base.entity.MBTIproblem;
import com.ybt.base.service.IMBTIProblemService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value = "/MBTIProblem/")
public class MBTIProblemController {

	
	@Resource
	private IMBTIProblemService mbtiProblemService;


	@RequestMapping(value = "addProblem")
	public ModelAndView addProblem() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manager/problem/addMBTIProblem");
		return mv;
	}


	@RequestMapping(value="save")
	public ModelAndView save(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		MBTIproblem problem = new MBTIproblem();
		problem.setMbtiProblem(request.getParameter("problem"));
		problem.setMbtiNumber(Integer.parseInt(request.getParameter("number")));
		problem.setResultA(request.getParameter("resultA"));
		problem.setResultB(request.getParameter("resultB"));
		mbtiProblemService.save(problem);
		mv.setViewName("manager/problem/addMBTIProblem");
		return mv;
	}
	


	
	@RequestMapping(value="allProblem")
	public void getAllProblem(HttpServletRequest request, HttpServletResponse response){
		
		List <MBTIproblem> list = mbtiProblemService.findAll();
		response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
	/*	response.setContentType("text/plain");
		response.setCharacterEncoding("GB2312");*/
		
		if (list!=null){
			JSONArray listObject=JSONArray.fromObject(list);
			PrintWriter out;
			try {
				out = new PrintWriter(response.getOutputStream());
				out.print(listObject);
				out.flush();
				System.out.println("发送报文："+listObject);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}else{
			
			PrintWriter out;
			try {
				out = new PrintWriter(response.getOutputStream());
				out.print("当前无题目");
				out.flush();
				System.out.println("发送报文："+"当前无题目");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
}


