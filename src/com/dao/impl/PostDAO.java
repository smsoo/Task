package com.dao.impl;
import java.util.List;

import com.dao.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.dao.BaseDAO;
import com.persistent.Post;


public class PostDAO implements IPostDAO{
	public void insertPost(Post post){
		Session session =BaseDAO.getSession();
		try{
			Transaction tx = session.beginTransaction();
			session.save(post);
			tx.commit();
		}catch(Exception e){
			System.out.println("PostDAO insertPost error"+e);
		}
		session.close();
	}
	public void updatePost(Post post){
		Session session =BaseDAO.getSession();
		try{
			Transaction tx = session.beginTransaction();
			session.update(post);
			tx.commit();
		}catch(Exception e){
			System.out.println("PostDAO updatePost error"+e);
		}
		session.close();
	}
	public void deletePost(Post post){
		Session session =BaseDAO.getSession();
		try{
			Transaction tx = session.beginTransaction();
			session.delete(post);
			tx.commit();
		}catch(Exception e){
			System.out.println("PostDAO postAccount error"+e);
		}
		session.close();
	}
	public Post searchPostById(int id){
		Session session =BaseDAO.getSession();
		String queryString ="from Post po where po.postId=:id";
		Query query = session.createQuery(queryString);
		query.setInteger("id", id);
		Post post=null;
		post=(Post)query.uniqueResult();
		session.close();
		return post;
	}
	public List<Post> searchAllActivePost(){
		Session session =BaseDAO.getSession();
		String queryString ="from Post po inner join fetch po.status stat where stat.statusId =:id";
		Query query = session.createQuery(queryString);
		query.setInteger("id", 1);
		List<Post> post=null;
		post=(List<Post>)query.list();
		session.close();
		return post;
	}
	
	
}
