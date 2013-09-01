package com.action;

import java.util.Date;
import java.util.Map;

import java.util.List;

import com.persistent.*;
import com.service.IAccountService;
import com.service.IFormService;
import com.service.impl.AccountService;
import com.service.impl.FormService;

import com.util.*;


import javax.swing.JOptionPane;

import com.dao.IFormDAO;
import com.dao.IPostDAO;
import com.dao.impl.FormDAO;
import com.dao.impl.PostDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;




public class BrowseAction  extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE = 16 * 1024 ;
	//private IAdminService adminService = new AdminService();
	//private IFormService formService = new FormService();
	private IPostDAO postDAO = new PostDAO();
	private IFormDAO formDAO = new FormDAO();
	//private IAccountService accountService = new AccountService();
	private String page;
	private String section;
	private String displayFunc;
	private Account account;
	private String message;
	private List<Post> posts;

	
	
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
	public IPostDAO getPostDAO() {
		return postDAO;
	}
	public void setPostDAO(IPostDAO postDAO) {
		this.postDAO = postDAO;
	}

	public List<Post> getPosts() {
		return posts;
	}
	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}

	
	
	public String execute() throws Exception{
		
		return SUCCESS;
	}
	public String browse(){
		Map session = ActionContext.getContext().getSession();
		posts = postDAO.searchAllActivePost();

		page="browse";
		return SUCCESS;
	}

}
