package com.global;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class CurrentDateTime {

	static Date todayDate;
	static DateFormat dateFormat;
	
	
	public static String getCurrentDate()
	{
		Date todayDate=new Date();
		DateFormat dateFormat=new SimpleDateFormat("dd-MM-yyyy HH:mm:ss a");
		dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
		return dateFormat.format(todayDate);
	}
}
