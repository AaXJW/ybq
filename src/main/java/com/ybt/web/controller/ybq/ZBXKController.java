package com.ybt.web.controller.ybq;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ybt.base.entity.MBTIproblem;
import com.ybt.base.entity.ZBXKProblem;
import com.ybt.base.service.IZBXKService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value = "/ZBXK/")
public class ZBXKController {

	@Resource
	private IZBXKService zbxkService;

	@RequestMapping(value = "addZBXK")
	public ModelAndView addZBXK() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manager/problem/addZBXK");
		return mv;
	}

	@RequestMapping(value = "save")
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manager/problem/addZBXK");

		String zbxkNumber = request.getParameter("zbxkNumber");

		String zbxkProblem = request.getParameter("zbxkProblem");

		String zbxkType = request.getParameter("zbxkType");

		ZBXKProblem problem = new ZBXKProblem();

		problem.setpNumber(zbxkNumber);
		problem.setpProblem(zbxkProblem);
		problem.setpType(zbxkType);

		zbxkService.save(problem);

		return mv;

	}

	@RequestMapping(value = "getAllZBXK")
	public void getAllZBXK(HttpServletRequest request, HttpServletResponse response) {

		List<ZBXKProblem> list = zbxkService.findAll();

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

	@RequestMapping(value = "getZBXKResult")
	public void getZBXKResult(HttpServletRequest request, HttpServletResponse response) {

		String data = request.getParameter("data").replace("=", "");
		String reData = "";
		
		response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = null;

		int WL = 0;

		int LS = 0;

		int HX = 0;

		int SW = 0;

		int DL = 0;

		int ZZ = 0;

		if (data != null) {
			String[] str = data.split("\\|");
			if (str.length > 0) {

				for (int i = 0; i < str.length; i++) {

					String subject[] = str[i].split(":");

					switch (subject[0]) {
					case "WL":
						WL += Integer.parseInt(subject[1]);
						break;
					case "LS":
						LS += Integer.parseInt(subject[1]);
						break;
					case "HX":
						HX += Integer.parseInt(subject[1]);
						break;
					case "SW":
						SW += Integer.parseInt(subject[1]);
						break;
					case "DL":
						DL += Integer.parseInt(subject[1]);
						break;
					case "ZZ":
						ZZ += Integer.parseInt(subject[1]);
						break;
					default:
						break;
					}

				}
				
				reData = ratio(WL,LS,HX,SW,DL,ZZ);

			} else {
				reData = "数据不合法";

			}
		} else {
			reData = "数据不合法";

		}
		try {
			out = new PrintWriter(response.getOutputStream());
			out.print("{\"data\""+":\""+reData+"\"}");
			out.flush();
			System.out.println("发送报文为："+reData);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public static String ratio(int wl,int ls,int hx,int sw,int dl,int zz){
		
		DecimalFormat df=new DecimalFormat("0.00");//设置保留位数
		 
		String WL =  df.format((float)wl/50);
		String LS =  df.format((float)ls/50);
		String HX =  df.format((float)hx/50);
		String SW =  df.format((float)sw/50);
		String DL =  df.format((float)dl/50);
		String ZZ =  df.format((float)zz/50);
		
		
		float [] fo = new float[]{(float)hx/50,(float)sw/50,(float)dl/50,(float)zz/50};
		
		
		Map map = new HashMap<>();
		map.put("HX", (float)hx/50);
		map.put("SW", (float)sw/50);
		map.put("DL", (float)dl/50);
		map.put("ZZ", (float)zz/50);
		BubbleSort(fo);
		
		String two = "";
		
		 
		
		for(int i = 0;i<fo.length;i++){
			
			two +="|"+getKey(map,fo[i])+":"+fo[i];
			
		}
		
		
		two.replaceAll("\\[", "");
		two.replaceAll("\\]", "");
		
		String first = "";
		
		
		if(wl>ls){ 
			first = "WL:"+WL+"|LS:"+LS;
		}else{
			
			first = "LS:"+LS+"|WL:"+WL;
		}
		
		String str = two.replaceAll("\\[", "").replaceAll("\\]", "");
		
		String tow2 = getZB(str).replaceAll(" ", "");
		
		
		
		
		return first+tow2.substring(0, tow2.length()-1);
	}
	
	
	
	public static void BubbleSort(float[] arr) {
		float temp;// 定义一个临时变量
		for (int i = 0; i < arr.length - 1; i++) {// 冒泡趟数
			for (int j = 0; j < arr.length - i - 1; j++) {
				if (arr[j + 1] > arr[j]) {
					temp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = temp;
				}
			}
		}
	}
	
	public static Object getKey(Map map, Object value){
	    List<Object> keyList = new ArrayList<>();
	    for(Object key: map.keySet()){
	        if(map.get(key).equals(value)){
	            keyList.add(key);
	        }
	    }
	    return keyList;
	}
	
	
	public static void main(String[] args) {
			System.out.println(ratio(35, 45, 10, -12, 15, 30));
			
			//System.out.println(getZB("|HX, ZZ, SW, DL:-0.24|HX, ZZ, SW, DL:-0.24|HX, ZZ, SW, DL:-0.24|HX, ZZ, SW, DL:-0.24"));
	}
	
	

	/**
	 * 得到字符串
	 * @param str
	 * @return
	 */
	public static String getZB(String str){
		
		String ss[] = str.split("\\|");
		
		
		String test[]= testA(ss);
		
		String data = "";
		
		for(int i = 0;i<test.length;i++){
			if(test[i].indexOf(",")!=-1){
				 
			String arr[] =test[i].split(":");
			
			String arr2[] = test[i].split(",");
			
			for(int j = 0;j<arr2.length;j++){
				if(j==arr2.length-1){
					data+=arr2[j]+"|";
				}else{
					
					data+=arr2[j]+":"+arr[1]+"|";
				}
				
			}
			}else{
				data+=test[i]+"|"; 
			}
		}
		return data;
	}
	
	
	/**
	 * 去重复的数组
	 * @param arrStr
	 * @return
	 */
	 public static String[] testA(String [] arrStr) {
	        List<String> list = new ArrayList<String>();
	        for (int i=0; i<arrStr.length; i++) {
	            if(!list.contains(arrStr[i])) {
	                list.add(arrStr[i]);
	            }
	        }
	        //返回一个包含所有对象的指定类型的数组
	        String[] newArrStr =  list.toArray(new String[1]);
	        return newArrStr;
	    }
	
	
}
