package com.dao;

public interface ProfileDaoI {
	
	public int updatePassword(String uname, String password);
	public int updateEmail(String uname, String email);
	public int updateFirstName(String uname, String fname);
	public int updateLastName(String uname, String lname);
	public int updatePicture(String uname, String profilepic);

}
