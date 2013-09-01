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




public class PostAction  extends ActionSupport{
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
	private List<Category> categories;
	private List<Post> posts;
	private Post post;
	private String postEndDate;
	
	
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
	public List<Category> getCategories() {
		return categories;
	}
	public void setCategories(List<Category> categories) {
		this.categories = categories;
	} 
	public List<Post> getPosts() {
		return posts;
	}
	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	} 
	public String getPostEndDate() {
		return postEndDate;
	}
	public void setPostEndDate(String postEndDate) {
		this.postEndDate = postEndDate;
	} 
	
	
	public String execute() throws Exception{
		
		return SUCCESS;
	}
	public String post(){
		
		categories = formDAO.searchAllCategory();
		if(displayFunc!=null){
			return "generate";
		}
		page="post";
		return SUCCESS;
	}
	public String submitPost(){
		
		Map session = ActionContext.getContext().getSession();
		Account acc=(Account)session.get("loginSess");
		//try{
			
		
			if(acc!=null){
				DateUtil du = new DateUtil();
				Post newPost = new Post();
				Status stat = formDAO.searchStatusById(1);
				
				newPost.setPostTitle(post.getPostTitle());
				newPost.setPostDesc(post.getPostDesc());
				newPost.setCategory(post.getCategory());
				newPost.setPostFee(post.getPostFee());
				newPost.setPostLocation(post.getPostLocation());
				newPost.setPostEndDate(du.convertStringDate(postEndDate));
				newPost.setPostPostedDate(du.getTimeStamp());
				newPost.setPostIsDeleted(0);
				newPost.setStatus(stat);
				newPost.setAccount(acc);
				newPost.setPostType("T");
				
				postDAO.insertPost(newPost);
			}
			posts = postDAO.searchAllActivePost();

			//addActionMessage("<script language='javascript' type='text/javascript'>alert('Task Posted!');location.href='browse.action';</script>   ");
			page="browse";
	//	}catch(Exception ex){
	//		ex.printStackTrace();
	//		return ERROR;
	//	}
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
	

}
