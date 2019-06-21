package com.ybt.base.utill;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class DateUtils {

	public static final int daysBetween(Date early, Date late) { 
	     
        Calendar calst = Calendar.getInstance();   
        Calendar caled = Calendar.getInstance();   
        calst.setTime(early);   
         caled.setTime(late);   
         //设置时间为0时   
         calst.set(Calendar.HOUR_OF_DAY, 0);   
         calst.set(Calendar.MINUTE, 0);   
         calst.set(Calendar.SECOND, 0);   
         caled.set(Calendar.HOUR_OF_DAY, 0);   
         caled.set(Calendar.MINUTE, 0);   
         caled.set(Calendar.SECOND, 0);   
        //得到两个日期相差的天数   
         int days = ((int) (caled.getTime().getTime() / 1000) - (int) (calst   
                .getTime().getTime() / 1000)) / 3600 / 24;   
         
        return days;   
   }
	
	
	public static Date jiaJianDate(Date beginDate,int day,int jiajian){
		SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar date = Calendar.getInstance();
		date.setTime(beginDate);
		date.set(Calendar.DATE, date.get(Calendar.DATE) + (jiajian>0?day:day*-1));
		Date endDate = beginDate;
		try {
			endDate = dft.parse(dft.format(date.getTime()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return endDate;
	}
	
	public static Date jiaJianTime(Date beginDate,int hour,int jiajian){
		SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar date = Calendar.getInstance();
		date.setTime(beginDate);
		date.set(Calendar.HOUR, date.get(Calendar.HOUR) + (jiajian>0?hour:hour*-1));
		Date endDate = beginDate;
		try {
			endDate = dft.parse(dft.format(date.getTime()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return endDate;
	}
	
	
	public static void main(String[] args){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=new Date();
		System.out.println("1= "+sdf.format(date));
		date = jiaJianTime(date,30,1);
		System.out.println("2= "+sdf.format(date));
		
	}
	
}
