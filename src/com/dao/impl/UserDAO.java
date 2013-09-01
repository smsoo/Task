package com.dao.impl;
import com.dao.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import com.dao.BaseDAO;
import com.persistent.User;


import java.util.HashMap;
import java.util.List;
import java.util.Iterator;

public class UserDAO implements IUserDAO{
	public void insertUser(User user){
		Session session =BaseDAO.getSession();
		try{
			Transaction tx = session.beginTransaction();
			session.save(user);
			tx.commit();
		}catch(Exception e){
			System.out.println("QuestionDAO insertUser error"+e);
		}
		session.close();
	}
	public void updateUser(User user){
		Session session =BaseDAO.getSession();
		try{
			Transaction tx = session.beginTransaction();
			session.update(user);
			tx.commit();
		}catch(Exception e){
			System.out.println("QuestionDAO updateUser error"+e);
		}
		session.close();
	}
	public void deleteUser(User user){
		Session session =BaseDAO.getSession();
		try{
			Transaction tx = session.beginTransaction();
			session.delete(user);
			tx.commit();
		}catch(Exception e){
			System.out.println("QuestionDAO deleteUser error"+e);
		}
		session.close();
	}
	public User searchUserById(int id){
		Session session =BaseDAO.getSession();
		String queryString ="from User ac where ac.accId=:id";
		Query query = session.createQuery(queryString);
		query.setInteger("id", id);
		User acc=null;
		acc=(User)query.uniqueResult();
		session.close();
		return acc;
	}
	
	public User searchUserByUserPass(User acc){
		Session session =BaseDAO.getSession();
		String queryString ="from User ussr where usr.Username= :username and usr.Password= :password";
		Query query = session.createQuery(queryString);
		query.setString("username",acc.getUsername());
		query.setString("password",acc.getPassword());
		List result = query.list();
		User act=null;
		if(result.size()!=0){
			act=(User)query.uniqueResult();
		}
		session.close();
		if(act!=null){
			return act;
		}
		return null;
	}
	public List<User> searchAllUser(int orderBy){
		Session session =BaseDAO.getSession();
		String queryString ="from User ac where ac.accType!=1 ";
		if(orderBy==1){
			queryString +=" order by ac.accUsername";
		}
		Query query = session.createQuery(queryString);
		List<User> acc=null;
		acc=query.list();
		session.close();
		return acc;
	}
	public User searchUserByUsername(User acc){
		Session session =BaseDAO.getSession();
		String queryString ="from User usr where usr.Username= :username ";
		Query query = session.createQuery(queryString);
		query.setString("username",acc.getUsername());
		List result = query.list();
		User act=null;
		if(result.size()!=0){
			act=(User)query.uniqueResult();
		}
		session.close();
		if(act!=null){
			return act;
		}
		return null;
	}

}
