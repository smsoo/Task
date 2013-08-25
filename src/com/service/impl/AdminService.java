package com.service.impl;

import java.util.List;


import com.dao.IAdminDAO;
import com.dao.impl.AdminDAO;
import com.service.IAdminService;


public class AdminService implements IAdminService{
	private IAdminDAO adminDAO;
	public AdminService(){
		this.adminDAO= new AdminDAO();
	}
	
}
