package com.service.impl;

import java.util.List;

import com.dao.IFormDAO;
import com.dao.impl.FormDAO;

import com.service.IFormService;

public class FormService implements IFormService{
	private IFormDAO formDAO;
	public FormService(){
		this.formDAO= new FormDAO();
	}
	
}
