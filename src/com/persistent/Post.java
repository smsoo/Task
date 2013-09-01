package com.persistent;

import java.util.Date;

@SuppressWarnings("serial")
public class Post implements java.io.Serializable{
	private int postId;
	private String postTitle;
	private String postDesc;
	private Category category;
	private String postLocation;
	private int postFee;
	private Date postEndDate;
	private Date postPostedDate;
	private Account account;
	private int postIsDeleted;
	private Status status;


	public Post(){
		
	}
	public Post(int postId, String postTitle, String postDesc, Category category,
			String postLocation, int postFee, Date postEndDate, Date postPostedDate, 
			Account account, int postIsDeleted, Status status) {
		
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

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
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



}

