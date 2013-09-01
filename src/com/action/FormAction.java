package com.action;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Iterator;
import java.util.Properties;

import com.persistent.*;

import com.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;




public class FormAction  extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE = 16 * 1024 ;

	private String page;
	private String section;
	private String displayFunc;

	private User user;
	private String message;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getDisplayFunc() {
		return displayFunc;
	}
	public void setDisplayFunc(String displayFunc) {
		this.displayFunc = displayFunc;
	}
	
	
	
	public String execute() throws Exception{
		
		return SUCCESS;
	}
	public String loadMainPage(){
		
		message = "Hello Task ~";
		if(displayFunc!=null){
			return "generate";
		}
		page="search";
		return SUCCESS;
	}
	public String login(){
	
		
		displayFunc = "loginA";
		
		if(displayFunc!=null){
			return "generate";
		}
		page="search";
		return SUCCESS;
	}
	public String loadDashboard(){
	
	
		page="dashboard";
		return SUCCESS;
	}
	public String verifyUserPassword() throws Exception{
		Map session = ActionContext.getContext().getSession();
		User usr=(User)session.get("loginSess");
		if(usr!=null){
			if(user!=null && user.getUsername()!=null && user.getPassword()!=null && usr.getUsername().trim().equals(user.getUsername().trim()) && usr.getPassword().trim().equals(user.getPassword().trim())){
				message="success";
			}else{
				message="fail";
			}
			displayFunc="verifyResult";
			return SUCCESS;
		}
		displayFunc="sessionEnd";
		return SUCCESS;
	}
	

}
