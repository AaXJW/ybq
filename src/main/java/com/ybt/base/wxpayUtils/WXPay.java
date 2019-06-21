package com.ybt.base.wxpayUtils;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.UUID;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import sun.security.provider.MD5;


public class WXPay {

	

	//private static String Key = "C724DA3EDF644DC88581336C873A114B";  

    /** 
     * @param args 
     *//*  
    public static void main(String[] args) {  
    	System.out.println("==========》微信签名开始");
        //微信api提供的参数  
        SortedMap<Object,Object> parameters = new TreeMap<Object,Object>();  
        parameters.put("appid", "wx6708accb359f41d9");
        parameters.put("body", "霍兰德职业测评");
        parameters.put("mch_id", "1535813111");
        parameters.put("nonce_str", "bkvYgKB14He08vWx");
        parameters.put("notify_url", "http://www.lvnnet.com/lincombPay/wcpay/wechatPayNotify");
      //  parameters.put("openid", "oPYQ-v-QWERTYUIhddryuiHKlsmMM");
        parameters.put("out_trade_no", "032018032916420100479947");
        parameters.put("spbill_create_ip", "172.16.107.206");
        parameters.put("total_fee", "1");
       // parameters.put("trade_type", "JSAPI");
        String signStr = createSign("UTF-8", parameters);
        System.out.println("生成微信签名==========》" + signStr);
        System.out.println("==========》微信签名结束");
    }  
  */
    /** 
     * 微信支付签名算法sign 
     * @param characterEncoding 
     * @param parameters 
     * @return 
     */  
    @SuppressWarnings({"rawtypes" })  
    public static String createSign(String characterEncoding,SortedMap<Object,Object> parameters,String key){  
        StringBuffer sb = new StringBuffer();
        //所有参与传参的参数按照accsii排序（升序）  
        Set<?> es = parameters.entrySet();
        Iterator<?> it = es.iterator();  
        while(it.hasNext()) {  
            Map.Entry entry = (Map.Entry)it.next();  
            String k = (String)entry.getKey();  
            Object v = entry.getValue();  
            if(null != v && !"".equals(v)   
                    && !"sign".equals(k) && !"key".equals(k)) {  
                sb.append(k + "=" + v + "&");  
            }  
        }  
        //重点说明：这个Key是对应的商户编码  是针对于支付发起的是有有个商户编号
        sb.append("key=" + key);
        System.out.println("加密前封装的字符串:"+sb.toString());
        String sign = MD5Util.MD5Encode(sb.toString(), characterEncoding).toUpperCase();  
        return sign;  
    } 
	
    
    public static String create_nonce_str() {
        String s = UUID.randomUUID().toString();
     	return s.replaceAll( "\\-","").toUpperCase();
    }
    
    
    public static void main(String[] args) {
    	System.out.println(create_nonce_str());;
	}
    
    
    
    public static Map<String, String> xmlToMap(String strXML) throws Exception {
        Map<String, String> data = new HashMap<String, String>();
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder= documentBuilderFactory.newDocumentBuilder();
        InputStream stream = new ByteArrayInputStream(strXML.getBytes("UTF-8"));
        org.w3c.dom.Document doc = documentBuilder.parse(stream);
        doc.getDocumentElement().normalize();
        NodeList nodeList = doc.getDocumentElement().getChildNodes();
        for (int idx=0; idx<nodeList.getLength(); ++idx) {
            Node node = nodeList.item(idx);
            if (node.getNodeType() == Node.ELEMENT_NODE) {
                org.w3c.dom.Element element = (org.w3c.dom.Element) node;
                data.put(element.getNodeName(), element.getTextContent());
            }
        }
        try {
            stream.close();
        }
        catch (Exception ex) {

        }
        return data;
    }
    
    
}
