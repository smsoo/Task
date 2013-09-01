package com.persistent;

@SuppressWarnings("serial")
public class Transaction implements java.io.Serializable{
	private int transactionID;
	private String remarks;
	private Response responseID;
	private Status status;
	private User user;
	
	
	public Transaction(){
		
	}


	public Transaction(int transactionID, String remarks, Response responseID, Status status, User user) {
		this.setTransactionID(transactionID);
		this.setRemarks(remarks);
		this.setResponseID(responseID);
		this.setStatus(status);
		this.user = user;
	}



	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Status getStatus() {
		return status;
	}


	public void setStatus(Status status) {
		this.status = status;
	}


	public int getTransactionID() {
		return transactionID;
	}


	public void setTransactionID(int transactionID) {
		this.transactionID = transactionID;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	public Response getResponseID() {
		return responseID;
	}


	public void setResponseID(Response responseID) {
		this.responseID = responseID;
	}
	
}
