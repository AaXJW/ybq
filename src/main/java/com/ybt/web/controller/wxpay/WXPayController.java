package com.ybt.web.controller.wxpay;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thoughtworks.xstream.XStream;
import com.ybt.base.entity.Order;
import com.ybt.base.service.IOrderService;
import com.ybt.base.wxpayUtils.WXPay;
import com.ybt.web.entity.PreparePay;
import com.ybt.web.entity.WXreturn;

import net.sf.json.JSONObject;

@Controller

@RequestMapping(value = "/WXPay/")
public class WXPayController {

	public static final String APPID = "wx6708accb359f41d9";

	public static final String MCH_ID = "1535813111";

	public static final String TRADE_TYPE = "JSAPI";

	public static final String NOTIFY_URL = "https://www.yibaiqian100.com/WXPay/notifyUrl.htm";

	public static final String URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";

	public static final String KEY = "C724DA3EDF644DC88581336C873A114B";
	
	
	@Resource
	private IOrderService orderService;

	@RequestMapping(value = "PayOrder")
	public void WXPay(HttpServletRequest request, HttpServletResponse response) {

		response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
		response.setCharacterEncoding("utf-8");

		/*
		 * response.setContentType("text/plain");
		 * response.setCharacterEncoding("GB2312");
		 */

		
		
		WXreturn wxreturn = new WXreturn();
		
		Order order = new Order();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String nonce_str = WXPay.create_nonce_str();

		String body = request.getParameter("body");
		/*try {
			body = new String(request.getParameter("body").getBytes("iso8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/

		long timeS = System.currentTimeMillis();
		
		long time2 = timeS/1000;
		
		String out_trade_no = timeS + "";

		String total_fee = request.getParameter("total_fee");

		String spbill_create_ip = request.getParameter("spbill_create_ip");

		String openid = request.getParameter("openid");
		
		String testID = request.getParameter("testID");
		
		

		// 获取签名
		System.out.println("==========》微信签名开始");
		SortedMap<Object, Object> parameters = new TreeMap<Object, Object>();

		parameters.put("appid", APPID);
		parameters.put("mch_id", MCH_ID);
		parameters.put("body", body);
		parameters.put("nonce_str", nonce_str);
		parameters.put("out_trade_no", out_trade_no);
		parameters.put("total_fee", total_fee);
		parameters.put("spbill_create_ip", spbill_create_ip);
		parameters.put("trade_type", TRADE_TYPE); 
		parameters.put("notify_url", NOTIFY_URL);
		parameters.put("openid", openid);
		String signStr = WXPay.createSign("UTF-8", parameters,KEY);
		System.out.println("签名：" + signStr);

		// 数据存入对象
		PreparePay pp = new PreparePay();
		pp.setAppid(APPID);
		pp.setMch_id(MCH_ID);
		pp.setNonce_str(nonce_str);
		pp.setSign(signStr);
		pp.setBody(body);
		pp.setOut_trade_no(out_trade_no);
		pp.setTotal_fee(total_fee);
		pp.setSpbill_create_ip(spbill_create_ip);
		pp.setNotify_url(NOTIFY_URL);
		pp.setTrade_type(TRADE_TYPE);
		pp.setOpenid(openid);

		XStream xStream = new XStream();
		xStream.alias("xml", PreparePay.class);
		String str = xStream.toXML(pp);

		String respXml = str.replace("__", "_");

		System.out.println("微信支付的xml为:" + respXml);

		String result = httpRequest(URL, "POST", respXml);

		System.out.println("请求微信预支付接口，返回 result：" + result);
		// 将解析结果存储在Map中
		Map map = new HashMap();
		
		
		
		order.setOpenID(openid);
		
		order.setTestID(testID);
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				
		order.setOrderTime(df.format(new Date()));
		
		
		try {
			InputStream in = new ByteArrayInputStream(result.getBytes());
			// 读取输入流
			SAXReader reader = new SAXReader();
			Document document;

			document = reader.read(in);
			Element root = document.getRootElement();
			// 得到根元素的所有子节点
			List<Element> elementList = root.elements();
			for (Element element : elementList) {
				map.put(element.getName(), element.getText());
			}
			
			
			SortedMap<Object, Object> parameters2 = new TreeMap<Object, Object>();

			parameters2.put("appId", APPID);
			parameters2.put("timeStamp", String.valueOf(time2));
			parameters2.put("nonceStr", nonce_str);
			parameters2.put("package","prepay_id="+ map.get("prepay_id").toString());
			parameters2.put("signType", "MD5");
//			parameters2.put("paySign", signStr);
			String signStr2 = WXPay.createSign("UTF-8", parameters2,KEY);
			System.out.println("二次签名：" + signStr2);
			
			
			
			
			// 返回信息
			String return_code = map.get("return_code").toString();// 返回状态码
			String return_msg = map.get("return_msg").toString();// 返回信息
			String result_code = map.get("result_code").toString();// 返回状态码
			

			
			wxreturn.setReturn_code(map.get("return_code").toString());
			wxreturn.setReturn_msg(map.get("return_msg").toString());
			wxreturn.setAppid(map.get("appid").toString());
			wxreturn.setMch_id(map.get("mch_id").toString());
			wxreturn.setNonce_str(  map.get("nonce_str").toString());
			wxreturn.setSign(map.get("sign").toString());
			wxreturn.setResult_code(map.get("result_code").toString());
			wxreturn.setPrepay_id(map.get("prepay_id").toString());
			wxreturn.setTrade_type(map.get("trade_type").toString());
			wxreturn.setTwoSign(signStr2);
			wxreturn.setTimeStamp(time2);
			wxreturn.setNonceStr(nonce_str);
			
			System.out.println(wxreturn);
			order.setState(0);
			order.setPrepayId(map.get("prepay_id").toString());
			
			
			System.out.println("请求微信预支付接口，返回 code：" + return_code);
			System.out.println("请求微信预支付接口，返回 msg：" + return_msg);
			System.out.println("请求微信预支付接口，返回 result_code：" + result_code);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			wxreturn.setResult_code("FAIL");
			wxreturn.setReturn_msg(result);
			order.setState(4);
		}finally {
			
			orderService.save(order);
			
			
			
			PrintWriter out;
			try {
				JSONObject listObject = JSONObject.fromObject(wxreturn);
				out = new PrintWriter(response.getOutputStream());
				out.print(listObject);
				out.flush();
				System.out.println("发送报文为："+listObject);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		}
		// 得到xml根元素

	}

	public static Object xmlToBean(String xmlPath, Class<?> load) throws JAXBException, IOException {
		JAXBContext context = JAXBContext.newInstance(load);
		Unmarshaller unmarshaller = context.createUnmarshaller();
		Object object = unmarshaller.unmarshal(new File(xmlPath));
		return object;
	}

	/**
	 * 微信返回地址
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "notifyUrl")
	public String wxNotify(HttpServletRequest request) {
		System.out.println();
		String xmlString = "";
		String lastXml = "";

		try {
			xmlString = getXmlString(request);
			System.out.println("微信返回数据:" + xmlString);
			// 先解析返回的数据
			Map<String, String> dataMap = WXPay.xmlToMap(xmlString);
			System.out.println("微信返回后map" + dataMap);
			String returnCode = dataMap.get("return_code");
		} catch (Exception e) {

		}
		return lastXml;

	}

	public String getXmlString(HttpServletRequest request) {
		BufferedReader reader = null;
		String line = "";
		String xmlString = null;
		try {
			reader = request.getReader();
			StringBuffer inputString = new StringBuffer();

			while ((line = reader.readLine()) != null) {
				inputString.append(line);
			}
			xmlString = inputString.toString();
		} catch (Exception e) {
			e.getMessage();
		}

		return xmlString;
	}

	public static String httpRequest(String requestUrl, String requestMethod, String outputStr) {
		// 创建SSLContext
		StringBuffer buffer = null;
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod(requestMethod);
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.connect();
			// 往服务器端写内容
			if (null != outputStr) {
				OutputStream os = conn.getOutputStream();
				os.write(outputStr.getBytes("utf-8"));
				os.close();
			}
			// 读取服务器端返回的内容
			InputStream is = conn.getInputStream();
			InputStreamReader isr = new InputStreamReader(is, "utf-8");
			BufferedReader br = new BufferedReader(isr);
			buffer = new StringBuffer();
			String line = null;
			while ((line = br.readLine()) != null) {
				buffer.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}
	
	
	
@RequestMapping(value = "PayResult")
public void PaeResult(HttpServletRequest request, HttpServletResponse response){
	
	response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
	response.setCharacterEncoding("utf-8");


	String prepayId = request.getParameter("prepayId");
	
	String result = request.getParameter("result");
	
	
	if (prepayId==null||"".equals(prepayId)||result==null||"".equals(result)){
		
		
		
		}else{
		
		Order order = orderService.findUniqueByProperty("prepayId",prepayId);
			if(order==null){
				
			}else{
				order.setState(Integer.parseInt(result));
				orderService.save(order);
			}
	}
	
	PrintWriter out;
	try {
		out = new PrintWriter(response.getOutputStream());
		out.print("success");
		out.flush();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
}


}
