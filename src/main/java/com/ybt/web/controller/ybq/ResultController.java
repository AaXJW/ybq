package com.ybt.web.controller.ybq;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.jiufengxinxi.core.query.ListPropertyFilter;
import com.jiufengxinxi.core.query.PropertyFilter;
import com.jiufengxinxi.core.query.PropertyFilter.MatchType;
import com.sun.prism.PhongMaterial.MapType;
import com.ybt.base.entity.Hollander;
import com.ybt.base.entity.Result;
import com.ybt.base.service.IHollanderService;
import com.ybt.base.service.IResultService;
import com.ybt.base.service.impl.ResultService;

/**
 * 返回结果的处理类
 * 
 * @author xujun
 *
 */
@Controller
@RequestMapping(value = "/Result/")
public class ResultController {

	@Resource
	private IHollanderService hollanderService;

	@Resource
	private IResultService resultService;

	@RequestMapping(value = "getResult")
	public void getResult(HttpServletRequest request, HttpServletResponse response) {
		String data = request.getParameter("data");
		response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
/*		response.setContentType("text/plain");
		response.setCharacterEncoding("GB2312");*/
		String re = "";

		int I = 0;// 研究型

		int R = 0;// 实践型

		int A = 0;// 艺术型

		int S = 0;// 社会型

		int E = 0;// 管理型

		int C = 0;// 计划型

		System.out.println("接收到的报文："+data);
		
		if (data == null || "".equals(data)) {
			re = "当前请求数据异常";
		} else {
			String str[] = data.split("\\|");
			if (str.length < 0) {
				re = "当前请求数据异常";
			} else {
				for (int i = 0; i < str.length; i++) {
					String[] answer = str[i].split(":");
					if (answer[0] != null) {
						Hollander hollander = hollanderService.findUniqueByProperty("number",
								Integer.parseInt(answer[0]));
						if (hollander == null || hollander.equals("")) {
							re = "当前解析数据异常";
						} else {
							if (Integer.parseInt(answer[1]) == hollander.getAnswer()) {
								switch (hollander.getType()) {
								case "I":
									I++;
									break;
								case "R":
									R++;
									break;
								case "A":
									A++;
									break;
								case "S":
									S++;
									break;
								case "E":
									E++;
									break;
								case "C":
									C++;
									break;
								default:
									break;
								}
							}

						}
					} else {
						re = "当前请求数据异常";
					}
				}
				
				String strCount = "I:"+I+"|R:"+R+"|A:"+A+"|S:"+S+"|E:"+E+"|C:"+C;
				
				String count = "\"count\""+":"+"\""+strCount+"\"";
				
				int arr[] = new int[] { I, R, A, S, E, C };
				BubbleSort(arr);

				String one = "";

				if (arr[5] == I) {
					one = "I";
				} else if (arr[5] == R) {
					one = "R";
				} else if (arr[5] == A) {
					one = "A";
				} else if (arr[5] == S) {
					one = "S";
				} else if (arr[5] == E) {
					one = "E";
				} else if (arr[5] == C) {
					one = "C";
				}

				String two = "";

				if (arr[4] == I && !"I".equals(one)) {
					two = "I";
				} else if (arr[4] == R && !"R".equals(one)) {
					two = "R";
				} else if (arr[4] == A && !"A".equals(one)) {
					two = "A";
				} else if (arr[4] == S && !"S".equals(one)) {
					two = "S";
				} else if (arr[4] == E && !"E".equals(one)) {
					two = "E";
				} else if (arr[4] == C && !"C".equals(one)) {
					two = "C";
				}
				String res = one+two;
				
				if ("AC".equals(res)||"CA".equals(res)){
					int rand=(int)(Math.random()*20)+1;
					if (rand<10){
						res = "AS";
					}else{
						res = "AE";
					}
				}
				Result result = resultService.findUniqueByProperty("Analysis", res);
				if (result == null) {
					String backRE = two+one;
					result = resultService.findUniqueByProperty("Analysis", backRE);
					if (result == null) {
						re = "无对应的结果";
					} else {
						re = result.getAnalysis() + ":" + result.getType();
					}
				} else {
					re = result.getAnalysis() + ":" + result.getType();
				}
				String ss = "{\"data\":\"" + re + "\","+count+"}";
				PrintWriter out;
				try {
					out = new PrintWriter(response.getOutputStream());
					out.print(ss);
					out.flush();
					System.out.println("发送报文为："+ss);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public static void BubbleSort(int[] arr) {
		int temp;// 定义一个临时变量
		for (int i = 0; i < arr.length - 1; i++) {// 冒泡趟数
			for (int j = 0; j < arr.length - i - 1; j++) {
				if (arr[j + 1] < arr[j]) {
					temp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = temp;
				}
			}
		}
	}

	
	public static void main(String[] args) {
		int rand=(int)(Math.random()*20)+1;
		System.out.println(rand);
	}
}
