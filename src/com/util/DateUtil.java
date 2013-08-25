package com.util;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.management.timer.Timer;
public class DateUtil {
	private Calendar currentcal = Calendar.getInstance();
	private DateFormat dfm = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss aa");
	private DateFormat doy= new SimpleDateFormat("yyyy/MM/dd");
	private DateFormat doy2= new SimpleDateFormat("yyyy-MMM-dd");
	private DateFormat doy3= new SimpleDateFormat("dd-MMM-yyyy");
	private DateFormat doy4= new SimpleDateFormat("yyyy-MM-dd");
	private DateFormat dfm4 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	private DateFormat toy= new SimpleDateFormat("HH:mm:ss aa");
	public Date convertStringDateTime(String strDate){

		java.util.Date realDate = null;
		try {
			realDate = dfm.parse(strDate+" 12:00:00 AM");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println(strDate+" 12:00:00 AM");
		//	e.printStackTrace();
		}
		return realDate;
	}
	public Date convertStringDateTimeStart(String strDate){

		java.util.Date realDate = null;
		try {
			realDate = dfm4.parse(strDate+" 00:00:01");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println(strDate+" 00:00:01");
		//	e.printStackTrace();
		}
		return realDate;
	}
	public Date convertStringDateTimeEnd(String strDate){

		java.util.Date realDate = null;
		try {
			realDate = dfm4.parse(strDate+" 11:59:59");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println(strDate+" 11:59:59");
		//	e.printStackTrace();
		}
		return realDate;
	}
	public Date convertStringDateTime(String strDate, String strTime){

		java.util.Date realDate = null;
		try {
			realDate = dfm.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return realDate;
	}
	public Date convertStringDate(String strDate){
		java.util.Date realDate = null;
		try {
			realDate = doy.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return realDate;
	}
	public Date convertStringDate2(String strDate){
		java.util.Date realDate = null;
		try {
			realDate = doy3.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return realDate;
	}
	public Timestamp getTimeStamp(){
		Timestamp now=new Timestamp( (new java.util.Date()).getTime() );	
		return now;
	}
	public int compareCurrentDate(Date realDate){
		Date now=this.getTimeStamp();
		return now.compareTo(realDate);
	}
	public String getCurrentDate(){
		return doy.format(currentcal.getTime());
	}
	public String getCurrentTime(){
		return toy.format(currentcal.getTime());
	}
	public String getCurrentDateTime(){
		return dfm.format(currentcal.getTime());
	}
	public String getCurrentDate2(){
		return doy2.format(currentcal.getTime());
	}
	public String getCurrentDate3(){
		return doy4.format(currentcal.getTime());
	}
	public String convertDateToString(java.util.Date realDate){
		return doy.format(realDate);
	}
	public String convertDateToString2(java.util.Date realDate){
		return doy2.format(realDate);
	}
	public String convertDateToString3(java.util.Date realDate){
		return doy4.format(realDate);
	}
	public String convertDateTimeToString(java.util.Date realDate){
		return dfm.format(realDate);
	}
	public static void main(String args[]){
		DateUtil du = new DateUtil();
		System.out.println(du.getCurrentDate());
		System.out.println(du.convertStringDateTime("2009/12/31").getTime());
	}
	public String formatLong(long n, int digits) {
	    /*
	          we create a format :
	           %% : %  the first % is to escape the second %
	           0  : 0  zero character
	           %d :    how many '0' we want (specified by digits)
	           d  : d  the number to format

	    */
	    String format = String.format("%%0%dd", digits);
	    return String.format(format, n);

	  }

	
}
