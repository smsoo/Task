package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.persistent.User;

public interface IUserDAO {
	public void insertUser(User user);
	public void updateUser(User user);
	public void deleteUser(User user);
	public User searchUserById(int id);
	public User searchUserByUserPass(User acc);
	public List<User> searchAllUser(int orderBy);
	public User searchUserByUsername(User acc);

}