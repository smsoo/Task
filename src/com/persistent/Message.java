package com.persistent;

@SuppressWarnings("serial")
public class Message implements java.io.Serializable{
	private int messageID;
	private String message;
	private Response responseID;
	private User from;
	private User to;
	
	
	public Message(){
		
	}


	public Message(int messageID, String message, Response responseID, User from, User to) {
		this.messageID = messageID;
		this.message = message;
		this.responseID = responseID;
		this.from = from;
		this.to = to;
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


	public User getFrom() {
		return from;
	}


	public void setFrom(User from) {
		this.from = from;
	}


	public User getTo() {
		return to;
	}


	public void setTo(User to) {
		this.to = to;
	}



}
