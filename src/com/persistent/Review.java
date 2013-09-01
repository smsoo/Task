package com.persistent;

@SuppressWarnings("serial")
public class Review implements java.io.Serializable{
	private int reviewID;
	private int rating;
	private String review;
	private User reviewBy;
	private User user;
	
	
	public Review(){
		
	}


	public Review(int reviewID, int rating, String review, Post post, User reviewBy, User user) {
		this.setReviewID(reviewID);
		this.setRating(rating);
		this.setReview(review);
		this.setReviewBy(reviewBy);
		this.user = user;
		
	}



	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public int getReviewID() {
		return reviewID;
	}


	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}


	public int getRating() {
		return rating;
	}


	public void setRating(int rating) {
		this.rating = rating;
	}


	public String getReview() {
		return review;
	}


	public void setReview(String review) {
		this.review = review;
	}


	public User getReviewBy() {
		return reviewBy;
	}


	public void setReviewBy(User reviewBy) {
		this.reviewBy = reviewBy;
	}


	
}
