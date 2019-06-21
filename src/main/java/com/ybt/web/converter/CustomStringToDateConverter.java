package com.ybt.web.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

import org.springframework.core.convert.converter.Converter;

public class CustomStringToDateConverter implements Converter<String, Date> {
	// 以下的正则表达式只是一个想法,可以根据需要修改.
	public static final Object[][] ACCEPT_DATE_FORMATS_REGEX = {
			{ Pattern.compile("yyyy-MM-dd HH:mm:ss"), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss") },
			{ Pattern.compile("yyyy-MM-dd HH:mm"), new SimpleDateFormat("yyyy-MM-dd HH:mm") },
			{ Pattern.compile("yyyy-MM-dd"), new SimpleDateFormat("yyyy-MM-dd") },
			{ Pattern.compile("yyyy/MM/dd"), new SimpleDateFormat("yyyy/MM/dd") },
			{ Pattern.compile("dd/MM/yyyy"), new SimpleDateFormat("dd/MM/yyyy") } };

	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public Date convert(String source) {
		if(source==null||source.trim().length()==0){
			return null;
		}
		String value = source;
		if (source.length() > 8 && source.indexOf(".") > -1)
			value = value.substring(0, value.indexOf("."));

		for (Object[] regexFormat : ACCEPT_DATE_FORMATS_REGEX) {
			Pattern pattern = (Pattern) regexFormat[0];
			SimpleDateFormat dateFormat = (SimpleDateFormat) regexFormat[1];
			if (pattern.pattern().length() == value.length())// pattern.matcher(values[0]).find())
			{
				try {
					return dateFormat.parse(value);
				} catch (ParseException e) {
					continue;
				}
			}
		}
		return doConvertToDate(source);

	}

	private Date doConvertToDate(String value) {
		Date result = null;
		if (value instanceof String)
			try {
				result = sdf.parse(value);
			} catch (ParseException e) {
				//throw new JQuickException(value+"Could not parse date", e);
			}
		return result;
	}
}
