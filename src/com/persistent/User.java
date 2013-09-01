package com.persistent;

@SuppressWarnings("serial")
public class User implements java.io.Serializable{
	private int userID;
	private String Password;
	private String Username;
	private int accDeleted;
	
	
	public User(){
		
	}


	public User(int userID, String Password, String Username,
			 int accDeleted) {
		this.setUserID(userID);
		this.setPassword(Password);
		this.setUsername(Username);
		this.accDeleted = accDeleted;		
	}



	public int getAccDeleted() {
		return accDeleted;
	}


	public void setAccDeleted(int accDeleted) {
		this.accDeleted = accDeleted;
	}


	public int getUserID() {
		return userID;
	}


	public void setUserID(int userID) {
		this.userID = userID;
	}


	public String getPassword() {
		return Password;
	}


	public void setPassword(String password) {
		Password = password;
	}


	public String getUsername() {
		return Username;
	}


	public void setUsername(String username) {
		Username = username;
	}


}
