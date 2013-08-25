package com.util;
import java.io.FileInputStream;
import java.util.Properties;

import org.apache.struts2.ServletActionContext;
public class PropertyUtil {
	
	public PropertyUtil(){
		
	}
	
	public String getUrlProperty(){
		String urlString=null;
		Properties prop = new Properties();
		try{
			String realPath =ServletActionContext.getServletContext().getRealPath("/properties/");
			realPath=realPath.replace("\\","\\\\");
			prop.load(new FileInputStream(realPath+"\\\\path.properties"));
			urlString=prop.getProperty("urlPath");
		}catch(Exception e){
			System.out.println(e);
		}
		return urlString;
	}
	public String getEmployeePicPathProperty(){
		String urlString=null;
		Properties prop = new Properties();
		try{
			String realPath =ServletActionContext.getServletContext().getRealPath("/properties/");
			realPath=realPath.replace("\\","\\\\");
			prop.load(new FileInputStream(realPath+"\\\\path.properties"));
			urlString=prop.getProperty("employeePicPath");
		}catch(Exception e){
			System.out.println(e);
		}
		return urlString;
	}
}
