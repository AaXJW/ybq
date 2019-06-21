package com.ybt.web.converter;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

import org.springframework.core.convert.converter.Converter;

public class CustomDateToStringConverter implements Converter<Date, String>{
	// 以下的正则表达式只是一个想法,可以根据需要修改.
	public static final Object[][] ACCEPT_DATE_FORMATS_REGEX = {
			{ Pattern.compile("yyyy-MM-dd HH:mm:ss"), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss") },
			{ Pattern.compile("yyyy-MM-dd HH:mm"), new SimpleDateFormat("yyyy-MM-dd HH:mm") },
			{ Pattern.compile("yyyy-MM-dd"), new SimpleDateFormat("yyyy-MM-dd") },
			{ Pattern.compile("yyyy/MM/dd"), new SimpleDateFormat("yyyy/MM/dd") },
			{ Pattern.compile("dd/MM/yyyy"), new SimpleDateFormat("dd/MM/yyyy") } };

	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public String convert(Date source) {
        String result = null;
        if(source instanceof Date)
            result = sdf.format(source);
        return result;
	}

}
