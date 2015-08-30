package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Admin;
import com.entity.User;

public interface ValidationDaoI {

	
	public User validateUser(String name,String pass);
	public Admin validateAdmin(String name,String pass);
	public void addAdmin(Admin admin);
	public Map<String,List<Integer[]>> performance(int user_id);
}
