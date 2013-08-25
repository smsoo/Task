package com.dao.impl;
import com.dao.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import com.dao.BaseDAO;
import com.persistent.Account;


import java.util.HashMap;
import java.util.List;
import java.util.Iterator;

public class AccountDAO implements IAccountDAO{
	public void insertAccount(Account account){
		Session session =BaseDAO.getSession();
		try{
			Transaction tx = session.beginTransaction();
			session.save(account);
			tx.commit();
		}catch(Exception e){
			System.out.println("QuestionDAO insertAccount error"+e);
		}
		session.close();
	}
	public void updateAccount(Account account){
		Session session =BaseDAO.getSession();
		try{
			Transaction tx = session.beginTransaction();
			session.update(account);
			tx.commit();
		}catch(Exception e){
			System.out.println("QuestionDAO updateAccount error"+e);
		}
		session.close();
	}
	public void deleteAccount(Account account){
		Session session =BaseDAO.getSession();
		try{
			Transaction tx = session.beginTransaction();
			session.delete(account);
			tx.commit();
		}catch(Exception e){
			System.out.println("QuestionDAO deleteAccount error"+e);
		}
		session.close();
	}
	public Account searchAccountById(int id){
		Session session =BaseDAO.getSession();
		String queryString ="from Account ac where ac.accId=:id";
		Query query = session.createQuery(queryString);
		query.setInteger("id", id);
		Account acc=null;
		acc=(Account)query.uniqueResult();
		session.close();
		return acc;
	}
	
	public Account searchAccountByUserPass(Account acc){
		Session session =BaseDAO.getSession();
		String queryString ="from Account a inner join fetch a.user where a.accUsername= :username and a.accPassword= :password";
		Query query = session.createQuery(queryString);
		query.setString("username",acc.getAccUsername());
		query.setString("password",acc.getAccPassword());
		List result = query.list();
		Account act=null;
		if(result.size()!=0){
			act=(Account)query.uniqueResult();
		}
		session.close();
		if(act!=null){
			return act;
		}
		return null;
	}
	public List<Account> searchAllAccount(int orderBy){
		Session session =BaseDAO.getSession();
		String queryString ="from Account ac where ac.accType!=1 ";
		if(orderBy==1){
			queryString +=" order by ac.accUsername";
		}
		Query query = session.createQuery(queryString);
		List<Account> acc=null;
		acc=query.list();
		session.close();
		return acc;
	}
	public Account searchAccountByUsername(Account acc){
		Session session =BaseDAO.getSession();
		String queryString ="from Account a where a.accUsername= :username ";
		Query query = session.createQuery(queryString);
		query.setString("username",acc.getAccUsername());
		List result = query.list();
		Account act=null;
		if(result.size()!=0){
			act=(Account)query.uniqueResult();
		}
		session.close();
		if(act!=null){
			return act;
		}
		return null;
	}

}
