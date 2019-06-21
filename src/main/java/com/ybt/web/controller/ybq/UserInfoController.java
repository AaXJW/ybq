package com.ybt.web.controller.ybq;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ybt.base.entity.UserInfo;
import com.ybt.base.entity.vo.LoInfo;
import com.ybt.base.service.IUserInfoService;
import com.ybt.test.SendGet;
import com.ybt.web.util.GetPhoneNumber;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/UserInfo/")
public class UserInfoController {

	@Resource
	private IUserInfoService userInfoService;

	@RequestMapping(value = "getUserInfo")
	public void UpdateUserInfo(HttpServletRequest request, HttpServletResponse response) {

		String jsCode = request.getParameter("jsCode");
		
		response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		

		String nickName = request.getParameter("nickName");
		/*try {
			nickName = new String(request.getParameter("nickName").getBytes("iso8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		;*/

		String gender = request.getParameter("gender");

		String language = request.getParameter("language");

		String city = request.getParameter("city");

		String result = "";

		/*
		 * response.setContentType("text/plain;charset=UTF-8"); //
		 * 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
		 * response.setCharacterEncoding("utf-8");
		 */

		/*response.setContentType("text/plain");
		response.setCharacterEncoding("GB2312");
*/
		if (jsCode == null || "".equals(jsCode)) {

			result = "当前JsCode为空，数据不合法";

		} else {

			String str = SendGet.SendGET(jsCode);

			JSONObject js = JSONObject.fromObject(str);

			LoInfo loinfo = (LoInfo) JSONObject.toBean(js, LoInfo.class);

			if (loinfo.getOpenid() == null || loinfo.getSession_key() == null) {

				result = "当前jsCode重复使用";

			} else {

				UserInfo userInfo = new UserInfo();

				UserInfo usInfo = userInfoService.findUniqueByProperty("openID", loinfo.getOpenid());

				if (usInfo != null) {

					userInfo = usInfo;
					userInfo.setSessionKey(loinfo.getSession_key());
				} else {

					userInfo.setNickName(nickName);
					userInfo.setGender(Integer.parseInt(gender));
					userInfo.setCity(city);
					userInfo.setLanguage(language);
					userInfo.setOpenID(loinfo.getOpenid());
					userInfo.setSessionKey(loinfo.getSession_key());
					userInfo.setMoTime(new Date());
					userInfoService.save(userInfo);
				}
				PrintWriter out;
				try {
					JSONObject listObject = JSONObject.fromObject(userInfo);
					out = new PrintWriter(response.getOutputStream());
					out.print(listObject);
					out.flush();
					System.out.println("发送报文：" + userInfo);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	@RequestMapping(value = "getOpenIDbyUserInfo")
	public void getOpenIDbyUserInfo(HttpServletRequest request, HttpServletResponse response) {

		String opneID = request.getParameter("openID");

		String result = "";
		if (opneID == null || "".equals(opneID)) {

			result = "当前openID为空";

		} else {

			UserInfo userInfo = userInfoService.findUniqueByProperty("openID", opneID);

			if (userInfo == null) {

				result = "fail";

			} else if (1 == 2) {

			}

		}

	}

	@SuppressWarnings("static-access")
	@RequestMapping(value = "getPhoneNumber")

	public void getPhoneNumber(HttpServletRequest request, HttpServletResponse response) {
		
		response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
		response.setCharacterEncoding("utf-8");

		String data = request.getParameter("data");

		String iv = request.getParameter("iv");

		String key = request.getParameter("key");

		String openID = request.getParameter("openID");

		String jsonStr = null;
		String result = null;

		System.out.println("收到报文为：data:"+data+"iv:"+iv+"openID:"+openID+"key:"+key);
		
		PrintWriter out;
		try {
			jsonStr = GetPhoneNumber.decrypt(data, key, iv);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (jsonStr == null || "".equals(jsonStr)) {
			result = "数据错误,解析异常";
			try {
				String ss = "{\"data\":\"state:faile,result:"+result+"}";
				out = new PrintWriter(response.getOutputStream());
				out.print(ss);
				out.flush();
				System.out.println("发送报文为：" + ss);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String phone = this.getPhone(jsonStr);

		if (openID != null && !"".equals(openID)) {

			UserInfo userInfo = userInfoService.findUniqueByProperty("openID", openID);

			if (userInfo != null) {
				UserInfo us = userInfo;
				us.setPhoneNumber(phone);
				userInfoService.save(us);
				result = "success";
				try {
					JSONObject listObject = JSONObject.fromObject(us);
					out = new PrintWriter(response.getOutputStream());
					out.print(listObject);
					out.flush();
					System.out.println("发送报文为：" + listObject);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				result = "当前openID异常,找不到有效数据";
				try {
					String ss = "{\"data\":\"state:faile,result:"+result+"}";
					out = new PrintWriter(response.getOutputStream());
					out.print(ss);
					out.flush();
					System.out.println("发送报文为：" + ss);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}


	}

	public static String getPhone(String str) {
		String phone = str.substring(str.indexOf("phoneNumber") + "phoneNumber".length(),
				str.indexOf("purePhoneNumber"));
		String regEx = "[^0-9]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(phone);
		return m.replaceAll("").trim();
	}

}
