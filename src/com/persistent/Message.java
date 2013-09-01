package com.persistent;

@SuppressWarnings("serial")
public class Message implements java.io.Serializable{
	private int messageID;
	private String message;
	private Response responseID;
	private User fromUser;
	private User toUser;
	
	
	public Message(){
		
	}


	public Message(int messageID, String message, Response responseID, User fromUser, User toUser) {
		this.messageID = messageID;
		this.message = message;
		this.responseID = responseID;
		this.fromUser = fromUser;
		this.toUser = toUser;
	}


	public int getMessageID() {
		return messageID;
	}


	public void setMessageID(int messageID) {
		this.messageID = messageID;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public Response getResponseID() {
		return responseID;
	}


	public void setResponseID(Response responseID) {
		this.responseID = responseID;
	}


	public User getFromUser() {
		return fromUser;
	}


	public void setFromUser(User fromUser) {
		this.fromUser = fromUser;
	}


	public User getToUser() {
		return toUser;
	}


	public void setToUser(User toUser) {
		this.toUser = toUser;
	}



}
