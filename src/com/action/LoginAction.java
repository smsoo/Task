package com.action;


import java.util.Map;
import javax.swing.JOptionPane;
import com.persistent.Account;
import com.service.IAccountService;
import com.service.impl.AccountService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	public static final long serialVersionUID = 1L;
	private IAccountService accountService= new AccountService();
	private Account account;
	private String page;
	private String displayFunc;
	private String message;
	
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
		if(account==null){
			addActionError("Please enter your username and password!");
			return ERROR;
		}
		
		String tempUsername=account.getAccUsername();
		String tempPassword=account.getAccPassword();

		account=new Account();
		account.setAccUsername(tempUsername);
		account.setAccPassword(tempPassword);
		account=accountService.searchAccountByUserPass(account);

		
		Map session = ActionContext.getContext().getSession();
		if(account!=null){

			message = "Welcome User!";
			page = "user";
			session.put("loginSess",account);
			if(account.getAccType()==1){
				return "admin";
			}else{

			}
			
			return SUCCESS;
		}else{
			page="search";
			addActionError("Invalid user name or password! Please try again!");
			return ERROR;
		}
	}
	public String verifyUserPassword() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Account acc=(Account)session.get("loginSess");
		if(acc!=null){
			if(account!=null && account.getAccUsername()!=null && account.getAccPassword()!=null && acc.getAccUsername().trim().equals(account.getAccUsername().trim()) && acc.getAccPassword().trim().equals(account.getAccPassword().trim())){
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
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
}

