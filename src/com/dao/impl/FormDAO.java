package com.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dao.*;
import com.persistent.Category;
import com.persistent.Status;


public class FormDAO implements IFormDAO{

	public List<Category> searchAllCategory() {
	
		Session session =BaseDAO.getSession();
		String queryString ="from Category cat where cat.catIsDeleted=0";
		Query query = session.createQuery(queryString);

		List<Category> cat=null;
		cat = (List<Category>)query.list();
		session.close();
		return cat;
		
	}

	public Status searchStatusById(int id) {
		Session session =BaseDAO.getSession();
		String queryString ="from Status stat where stat.statusId =:id";
		Query query = session.createQuery(queryString);
		query.setInteger("id", id);
		Status stat=null;
		stat = (Status)query.uniqueResult();
		session.close();
		return stat;
	}
	
}
