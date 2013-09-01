package com.persistent;

import java.util.Date;

@SuppressWarnings("serial")
public class Post implements java.io.Serializable{
	private int postId;
	private String postType;
	private String postTitle;
	private String postDesc;
	private Category category;
	private String postLocation;
	private int postFee;
	private Date postEndDate;
	private Date postPostedDate;
	private User user;
	private int postIsDeleted;
	private Status status;


	public Post(){
		
	}
	public Post(int postId, String type, String postTitle, String postDesc, Category category,
			String postLocation, int postFee, Date postEndDate, Date postPostedDate, 
			User user, int postIsDeleted, Status status) {
		
		this.postId = postId;
		this.postTitle = postTitle;
		this.postDesc = postDesc;
		this.category = category;
		this.postLocation = postLocation;
		this.postFee = postFee;
		this.postEndDate = postEndDate;
		this.postPostedDate = postPostedDate;
		this.postIsDeleted = postIsDeleted;
		this.status = status;
		this.postType = type;

	}

	public int getPostId() {
		return postId;
	}


	public void setPostId(int postId) {
		this.postId = postId;
	}
	
	public String getPostTitle() {
		return postTitle;
	}


	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostDesc() {
		return postDesc;
	}

	public void setPostDesc(String postDesc) {
		this.postDesc = postDesc;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getPostLocation() {
		return postLocation;
	}

	public void setPostLocation(String postLocation) {
		this.postLocation = postLocation;
	}

	public int getPostFee() {
		return postFee;
	}

	public void setPostFee(int postFee) {
		this.postFee = postFee;
	}

	public Date getPostEndDate() {
		return postEndDate;
	}

	public void setPostEndDate(Date postEndDate) {
		this.postEndDate = postEndDate;
	}

	public Date getPostPostedDate() {
		return postPostedDate;
	}

	public void setPostPostedDate(Date postPostedDate) {
		this.postPostedDate = postPostedDate;
	}

	public int getPostIsDeleted() {
		return postIsDeleted;
	}

	public void setPostIsDeleted(int postIsDeleted) {
		this.postIsDeleted = postIsDeleted;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public String getPostType() {
		return postType;
	}
	public void setPostType(String postType) {
		this.postType = postType;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}



}

