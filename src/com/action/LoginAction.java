package com.action;


import java.util.Map;
import javax.swing.JOptionPane;
import com.persistent.User;

import com.dao.IUserDAO;
import com.dao.impl.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	public static final long serialVersionUID = 1L;
	private IUserDAO userDAO= new UserDAO();
	private User user;
	private String page;
	private String displayFunc;
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

	public String getDisplayFunc() {
		return displayFunc;
	}

	public void setDisplayFunc(String displayFunc) {
		this.displayFunc = displayFunc;
	}

	

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String execute() throws Exception{
		if(user==null){
			addActionError("Please enter your username and password!");
			return ERROR;
		}
		
		String tempUsername=user.getUsername();
		String tempPassword=user.getPassword();
	
		user=new User();
		user.setUsername(tempUsername);
		user.setPassword(tempPassword);
		user=userDAO.searchUserByUserPass(user);
	

		
		Map session = ActionContext.getContext().getSession();
		if(user!=null){

			message = "Welcome User!";
			page = "dashboard";
			session.put("loginSess",user);
			
			
			return SUCCESS;
		}else{
			page="search";
			addActionError("Invalid user name or password! Please try again!");
			return ERROR;
		}
	}
	public String verifyUserPassword() throws Exception{
		Map session = ActionContext.getContext().getSession();
		User usr=(User)session.get("loginSess");
		if(usr!=null){
			if(user!=null && user.getUsername()!=null && user.getPassword()!=null && usr.getUsername().trim().equals(usr.getUsername().trim()) && usr.getPassword().trim().equals(user.getPassword().trim())){
				message="success";
				return SUCCESS;
			}else{
				message="fail";
			}
			displayFunc="verifyResult";
			return SUCCESS;
		}
		displayFunc="sessionEnd";
		return SUCCESS;
	}
	public String logoutProcess() throws Exception{
		Map session = ActionContext.getContext().getSession();
		session.remove("loginSess"); 
		session.remove("approvalSess");
		return SUCCESS;
	}

}

