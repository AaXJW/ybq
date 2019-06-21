package com.ybt.web.controller.ybq;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ybt.base.entity.Article;
import com.ybt.base.entity.QualityAbility;
import com.ybt.base.entity.QualityAbilityResult;
import com.ybt.base.service.IQualityAbilityResultService;
import com.ybt.base.service.IQualityAbilityService;
import com.ybt.web.entity.QAResult;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/QualityAbility/")
public class QualityAbilityController {

	@Resource
	private IQualityAbilityService qualityAbilityService;

	@Resource
	private IQualityAbilityResultService qualityAbilityResultService;

	@RequestMapping(value = "addQualityAbility")
	public ModelAndView addZBXK() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manager/problem/addQualityAbility");
		return mv;
	}

	// 题目添加
	@RequestMapping(value = "save")
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manager/problem/addQualityAbility");

		String qaNumber = request.getParameter("qaNumber");

		String qaProblem = request.getParameter("qaProblem");

		String qaType = request.getParameter("qaType");

		QualityAbility problem = new QualityAbility();

		problem.setpNumber(qaNumber);
		problem.setpProblem(qaProblem);
		problem.setpType(qaType);
		qualityAbilityService.save(problem);

		return mv;

	}

	// 解析结果添加
	@RequestMapping(value = "addQualityAbilityResult")
	public ModelAndView addQualityAbilityResult() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manager/problem/addQualityAbilityResult");
		return mv;
	}

	@RequestMapping(value = "saveQualityAbilityResult")
	public ModelAndView saveQualityAbilityResult(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manager/problem/addQualityAbilityResult");

		String qaFraction = request.getParameter("qaFraction");

		String qaAnalysis = request.getParameter("qaAnalysis");

		String qaStudy = request.getParameter("qaStudy");

		String qaProposal = request.getParameter("qaProposal");

		String qaType = request.getParameter("qaType");

		QualityAbilityResult problem = new QualityAbilityResult();

		problem.setQaFraction(Integer.parseInt(qaFraction));
		problem.setQaAnalysis(qaAnalysis);
		problem.setQaStudy(qaStudy);
		problem.setQaProposal(qaProposal);
		problem.setQaType(qaType);

		qualityAbilityResultService.save(problem);

		return mv;

	}

	@RequestMapping(value = "getAllQualityAbility")
	public void getAllZBXK(HttpServletRequest request, HttpServletResponse response) {

		List<QualityAbility> list = qualityAbilityService.findAll();

		response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = null;
		try {
			out = new PrintWriter(response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (list != null) {

			JSONArray listObject = JSONArray.fromObject(list);
			out.print(listObject);
		} else {
			out.print("当前无题目");
		}
		out.flush();

	}
	
	@RequestMapping(value = "getQualityAbilityResult")
	public void getQualityAbilityResult(HttpServletRequest request, HttpServletResponse response) {

		String data = request.getParameter("data").replaceAll("=", "");

		String redata = "";
		
		response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
		response.setCharacterEncoding("utf-8");

		int L = 0;

		int M = 0;

		int S = 0;

		int B = 0;

		int I1 = 0;

		int I2 = 0;

		if (data != null) {

			String[] str = data.split("\\|");

			if (str.length > 0) {

				for (int i = 0; i < str.length; i++) {

					String[] arr = str[i].split(":");

					switch (arr[0]) {
					case "L":
						L += Integer.parseInt(arr[1]);
						break;
					case "M":
						M += Integer.parseInt(arr[1]);
						break;
					case "S":
						S += Integer.parseInt(arr[1]);
						break;
					case "B":
						B += Integer.parseInt(arr[1]);
						break;
					case "I1":
						I1 += Integer.parseInt(arr[1]);
						break;
					case "I2":
						I2 += Integer.parseInt(arr[1]);
						break;

					default:
						break;
					}

				}
				
				String allType = "L:"+L+"|M:"+M+"|S:"+S+"|B:"+B+"|I1:"+I1+"|I2:"+I2;
				try {
				QualityAbilityResult qualityAbilityResultL = qualityAbilityResultService.getQualityAbilityResult(L,"L");
				QualityAbilityResult qualityAbilityResultM = qualityAbilityResultService.getQualityAbilityResult(M,"M");
				QualityAbilityResult qualityAbilityResultS = qualityAbilityResultService.getQualityAbilityResult(S,"S");
				QualityAbilityResult qualityAbilityResultB = qualityAbilityResultService.getQualityAbilityResult(B,"B");
				QualityAbilityResult qualityAbilityResultI1 = qualityAbilityResultService.getQualityAbilityResult(I1,"I1");
				QualityAbilityResult qualityAbilityResultI2 = qualityAbilityResultService.getQualityAbilityResult(I2,"I2");
				
				QAResult qaResult = new QAResult();
				qaResult.setType_L(qualityAbilityResultL);
				qaResult.setType_M(qualityAbilityResultM);
				qaResult.setType_S(qualityAbilityResultS);
				qaResult.setType_B(qualityAbilityResultB);
				qaResult.setType_I1(qualityAbilityResultI1);
				qaResult.setType_I2(qualityAbilityResultI2);
				qaResult.setAll_Type(allType);
				
				
				PrintWriter out;
				
					JSONObject listObject = JSONObject.fromObject(qaResult);
					out = new PrintWriter(response.getOutputStream());
					out.print(listObject);
					out.flush();
					System.out.println("发送报文为："+listObject);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				

			} else {

				redata = "当前数据不合法";
				PrintWriter out;
				try {
					out = new PrintWriter(response.getOutputStream());
					out.print(redata);
					out.flush();
					System.out.println("发送报文为："+redata);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}

		} else {

			redata = "当前数据不合法";
			PrintWriter out;
			try {
				out = new PrintWriter(response.getOutputStream());
				out.print(redata);
				out.flush();
				System.out.println("发送报文为："+redata);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	

}
