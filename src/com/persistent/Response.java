package com.persistent;

@SuppressWarnings("serial")
public class Response implements java.io.Serializable{
	private int responseID;
	private Post post;
	private Status status;
	private User user;
	
	
	public Response(){
		
	}


	public Response(int resID, Post post, Status status, User user) {
		this.setResponseID(resID);
		this.setPost(post);
		this.setStatus(status);
		this.user = user;
	}



	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public int getResponseID() {
		return responseID;
	}


	public void setResponseID(int responseID) {
		this.responseID = responseID;
	}


	public Post getPost() {
		return post;
	}


	public void setPost(Post post) {
		this.post = post;
	}


	public Status getStatus() {
		return status;
	}


	public void setStatus(Status status) {
		this.status = status;
	}
	
}
