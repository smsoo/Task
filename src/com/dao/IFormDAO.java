package com.dao;

import java.util.List;

import com.persistent.Category;
import com.persistent.Status;


public interface IFormDAO {
	public List<Category> searchAllCategory();
	public Status searchStatusById(int id);
}
