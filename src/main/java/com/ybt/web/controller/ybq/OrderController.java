package com.ybt.web.controller.ybq;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ybt.base.entity.Order;
import com.ybt.base.service.IOrderService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value = "/Order/")
public class OrderController {

	@Resource
	private IOrderService orderService;

	@RequestMapping("getAllOrder")
	public void getAllOrder(HttpServletRequest request, HttpServletResponse response) {
		List<Order> list = orderService.findAll();
		String result = "";
		PrintWriter out;
		try {
			
			response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
			response.setCharacterEncoding("utf-8");
			
		/*	response.setContentType("text/plain");
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

}
