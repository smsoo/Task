package com.service;

import java.util.List;

import com.persistent.Account;

public interface IAccountService {
	public void insertAccount(Account account);
	public void updateAccount(Account account);
	public void deleteAccount(Account account);
	public Account searchAccountById(int id);
	public Account searchAccountByUserPass(Account acc);
	public List<Account> searchAllAccount(int orderBy);
	public Account searchAccountByUsername(Account acc);

}
