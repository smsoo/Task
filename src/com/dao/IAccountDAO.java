package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.persistent.Account;

public interface IAccountDAO {
	public void insertAccount(Account account);
	public void updateAccount(Account account);
	public void deleteAccount(Account account);
	public Account searchAccountById(int id);
	public Account searchAccountByUserPass(Account acc);
	public List<Account> searchAllAccount(int orderBy);
	public Account searchAccountByUsername(Account acc);

}