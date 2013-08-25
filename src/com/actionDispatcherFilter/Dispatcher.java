package com.actionDispatcherFilter;

import javax.servlet.*;
import org.apache.struts2.dispatcher.FilterDispatcher;
import org.hibernate.HibernateException;
import com.dao.BaseDAO;

public class Dispatcher extends FilterDispatcher {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		super.init(filterConfig);
		try {
			BaseDAO.createSessionFactory();
			System.out.print("application initializing successfully");
		} catch (HibernateException e) {
			throw new ServletException(e);
		}

	}

}