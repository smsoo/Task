package com.dao;

import java.util.List;

import com.persistent.Post;

public interface IPostDAO {
	public void insertPost(Post post);
	public void updatePost(Post post);
	public void deletePost(Post post);
	public Post searchPostById(int id);
	public List<Post> searchAllActivePost();


}