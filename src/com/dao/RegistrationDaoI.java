package com.dao;

import java.util.List;
import java.util.Map;

public interface RegistrationDaoI {
	
	public int addUser(int user_id, String username, String first_name, String last_name,String profile_pic ,String email, String password);
	/*public Map<String,List<String>> getCategories();*/
	public int maxKey(String table_name, String id);
}
