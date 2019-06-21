package com.ybt.web.controller.ybq;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ybt.base.entity.MBTIResult;
import com.ybt.base.service.IMBTIResultService;
import com.ybt.web.entity.ReMBTI;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/MBTIResult/")
public class MBTIResultController {

	
	@Resource
	private IMBTIResultService mbtiResultService;
	
	@RequestMapping(value = "getResult")
	public void getResult(HttpServletRequest request, HttpServletResponse response) {
		String result = "";
		String data = request.getParameter("data");
		System.out.println("获取到数据为:"+data);
		response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		/*response.setContentType("text/plain");
		response.setCharacterEncoding("GB2312");*/
		
		int E = 0;
		
		int I = 0;
		
		int S = 0;
		
		int N = 0;
		
		int T = 0;
		
		int F = 0;
		
		int J = 0;
		
		int P = 0;
		
		
		if ("".equals(data)){
			result = "当前获取数据异常";
		}else{
			String []str = data.split("\\|");
			/*if(str.length<48 ){
				result = "当前数据异常，题目没有48道";
			}else{*/
				for (int i = 1 ;i<=str.length;i++){
					
					String Choice = str[i-1].split(":")[1];
					
					if(i%4==1){
						if("A".equals(Choice)){
							E++;
						}else{
							I++;
							
						}
						
					}else if (i%4==2){
						if("A".equals(Choice)){
							S++;
						}else {
							N++;
							
						}
						
					}else if (i%4==3){
						if("A".equals(Choice)){
							T++;
						}else {
							F++;
							
						}
						
						
					}else{
						if("A".equals(Choice)){
							J++;
						}else {
							P++;
							
						}
						
					}
					
				}
				
			//}
			
			
			String one = getMax(E,I,"E","I");
			String two = getMax(S,N,"S","N");
			String  three = getMax(T,F,"T","F");
			String fore = getMax(J,P,"J","P");
			
			StringBuffer sb = new StringBuffer();
			sb.append(one);
			sb.append(two);
			sb.append(three);
			sb.append(fore);
			
			
			
			String strCount = "E:"+E+"|I:"+I+"|S:"+S+"|N:"+N+"|T:"+T+"|F:"+F+"|J:"+J+"|P:"+P;
			
			String count = "\"count\""+":"+"\""+strCount+"\"";
			
			
			MBTIResult mbtiresult = mbtiResultService.findUniqueByProperty("type",sb.toString());
			if (mbtiresult==null){
				result = "当前结果值异常";
				
			}else{
				result = mbtiresult.getType()+":"+mbtiresult.getCharacterType();
			}

			String value = "{\"data\":\"" + result+"\","+count+"}";

			
			ReMBTI reMBTI = new ReMBTI();
			
			reMBTI.setData(result);
			reMBTI.setCount(strCount);
			
			PrintWriter out;
			try {
				JSONObject listObject = JSONObject.fromObject(reMBTI);
				out = new PrintWriter(response.getOutputStream());
				out.print(listObject);
				out.flush();
				System.out.println("发送报文为："+listObject);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	
	
	
	public static String getMax(int a,int b,String strA,String strB){
		if (a==b){
			int rand=(int)(Math.random()*20)+1;
			if (rand<10){
				return strA;
			}else{
				return strB;
			}
		}else{
			return a>b?strA:strB;
		}
	}
	
	
}
