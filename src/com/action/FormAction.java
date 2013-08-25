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
import com.service.IAccountService;
import com.service.IAdminService;
import com.service.IFormService;
import com.service.impl.AccountService;
import com.service.impl.AdminService;
import com.service.impl.FormService;

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
	private IAdminService adminService = new AdminService();
	private IFormService formService = new FormService();
	private IAccountService accountService = new AccountService();
	private String page;
	private String section;
	private String displayFunc;

	private Account account;
	private String message;
	
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
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
	
		
		displayFunc = "loginForm";
		
		if(displayFunc!=null){
			return "generate";
		}
		page="search";
		return SUCCESS;
	}
	public String verifyUserPassword() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Account acc=(Account)session.get("loginSess");
		if(acc!=null){
			if(account!=null && account.getAccUsername()!=null && account.getAccPassword()!=null && acc.getAccUsername().trim().equals(account.getAccUsername().trim()) && acc.getAccPassword().trim().equals(account.getAccPassword().trim())){
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
	
	private static void copy(File src, File dst)  {
        try  {
           InputStream in = null ;
           OutputStream out = null ;
            try  {                
               in = new BufferedInputStream( new FileInputStream(src), BUFFER_SIZE);
               out = new BufferedOutputStream( new FileOutputStream(dst), BUFFER_SIZE);
                byte [] buffer = new byte [BUFFER_SIZE];
                while (in.read(buffer) > 0 )  {
                   out.write(buffer);
               } 
            } finally  {
                if ( null != in)  {
                   in.close();
               } 
                 if ( null != out)  {
                   out.close();
               } 
           } 
        } catch (Exception e)  {
        	System.out.println("Error upload file "+e);
           e.printStackTrace();
       } 
   } 
	private static String getExtention(String fileName)  {
        int pos = fileName.lastIndexOf( "." );
        return fileName.substring(pos);
    } 
}
