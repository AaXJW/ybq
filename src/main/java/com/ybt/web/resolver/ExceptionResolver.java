package com.ybt.web.resolver;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.jiufengxinxi.core.exception.BusinessException;
import com.jiufengxinxi.utils.BeanValidators;

/**
 * 
 * @author jerry
 *
 */
public class ExceptionResolver implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		// TODO Auto-generated method stub
		System.out.println("==============异常开始=============");
		ModelAndView mv = new ModelAndView();
		if(ex instanceof ConstraintViolationException){
			List<String> errors = BeanValidators.extractPropertyAndMessage((ConstraintViolationException)ex, ":");
			mv.addObject("errors", errors);
			mv.setViewName("error/valid");
			ex.printStackTrace();
		}else if(ex instanceof BusinessException){
			System.out.println(ex.getMessage());
			mv.addObject("message", ex.getMessage());
			mv.setViewName("error/message");
		}else{
			mv.setViewName("error/error");
			ex.printStackTrace();
			mv.addObject("exception", ex.toString().replaceAll("\n", "<br/>"));
		}
		System.out.println("==============异常结束=============");
		return mv;
	}

}
