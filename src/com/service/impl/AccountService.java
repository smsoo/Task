package com.service.impl;

import java.util.List;

import com.dao.IAccountDAO;
import com.dao.impl.AccountDAO;
import com.persistent.Account;
import com.service.IAccountService;


public class AccountService implements IAccountService{
	private IAccountDAO accountDAO;

	public AccountService(){
		this.accountDAO= new AccountDAO();
	}
	public void insertAccount(Account account){
		accountDAO.insertAccount(account);
	}
	public void updateAccount(Account account){
		accountDAO.updateAccount(account);
	}
	public void deleteAccount(Account account){
		accountDAO.deleteAccount(account);
	}
	public Account searchAccountById(int id){
		return accountDAO.searchAccountById(id);
	}
	public Account searchAccountByUserPass(Account acc){
		return accountDAO.searchAccountByUserPass(acc);
	}
	public List<Account> searchAllAccount(int orderBy){
		return accountDAO.searchAllAccount(orderBy);
	}
	public Account searchAccountByUsername(Account acc){
		return accountDAO.searchAccountByUsername(acc);
	}

}
