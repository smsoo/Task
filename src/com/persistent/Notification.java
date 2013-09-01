package com.persistent;

@SuppressWarnings("serial")
public class Notification implements java.io.Serializable{
	private int notificationID;
	private String notification;
	private Response responseID;
	private User recipient;
	private Status status;
	
	
	public Notification(){
		
	}


	public Notification(int notificationID, String notification, Response responseID, User recipient, Status status) {
		this.setNotificationID(notificationID);
		this.setNotification(notification);
		this.setResponseID(responseID);
		this.setRecipient(recipient);
		this.status = status;
		
	}


	public Status getStatus() {
		return status;
	}


	public void setStatus(Status status) {
		this.status = status;
	}


	public Response getResponseID() {
		return responseID;
	}


	public void setResponseID(Response responseID) {
		this.responseID = responseID;
	}


	public String getNotification() {
		return notification;
	}


	public void setNotification(String notification) {
		this.notification = notification;
	}


	public int getNotificationID() {
		return notificationID;
	}


	public void setNotificationID(int notificationID) {
		this.notificationID = notificationID;
	}


	public User getRecipient() {
		return recipient;
	}


	public void setRecipient(User recipient) {
		this.recipient = recipient;
	}
	
}
