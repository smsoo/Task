package com.persistent;

@SuppressWarnings("serial")
public class Account implements java.io.Serializable{
	private int accId;
	private String accPassword;
	private String accUsername;
	private int accType;
	private int accDeleted;
	private User user;
	
	
	public Account(){
		
	}


	public Account(int accId, String accPassword, String accUsername,
			int accType, int accDeleted, User user) {
		this.accId = accId;
		this.accPassword = accPassword;
		this.accUsername = accUsername;
		this.accType = accType;
		this.accDeleted = accDeleted;
		this.user = user;
	}


	public int getAccId() {
		return accId;
	}


	public void setAccId(int accId) {
		this.accId = accId;
	}


	public String getAccPassword() {
		return accPassword;
	}


	public void setAccPassword(String accPassword) {
		this.accPassword = accPassword;
	}


	public String getAccUsername() {
		return accUsername;
	}


	public void setAccUsername(String accUsername) {
		this.accUsername = accUsername;
	}


	public int getAccType() {
		return accType;
	}


	public void setAccType(int accType) {
		this.accType = accType;
	}

	public int getAccDeleted() {
		return accDeleted;
	}


	public void setAccDeleted(int accDeleted) {
		this.accDeleted = accDeleted;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}
	
}
