package com.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.entity.User;

public class ProfileDaoImpl implements ProfileDaoI{
	
	private HibernateTemplate hibernateTemplate;
	


	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public int updatePassword(String uname, String password) {
		String hql = "select uid from User where username = ?";
		Object[] params = {uname};
		List<Integer> lst = hibernateTemplate.find(hql, params);
		int uid = lst.get(0);
		User user = (User) hibernateTemplate.get(User.class, uid);
		user.setPassword(password);
		hibernateTemplate.update(user);
		return 1;
	}

	public int updateEmail(String uname, String email) {
		String hql = "select uid from User where username = ?";
		Object[] params = {uname};
		List<Integer> lst = hibernateTemplate.find(hql, params);
		int uid = lst.get(0);
		User user = (User) hibernateTemplate.get(User.class, uid);
		user.setEmail(email);
		hibernateTemplate.update(user);
		return 1;
	}

	public int updateFirstName(String uname, String fname) {
		String hql = "select uid from User where username = ?";
		Object[] params = {uname};
		List<Integer> lst = hibernateTemplate.find(hql, params);
		int uid = lst.get(0);
		User user = (User) hibernateTemplate.get(User.class, uid);
		user.setFirst_name(fname);
		hibernateTemplate.update(user);
		return 1;
	}

	public int updateLastName(String uname, String lname) {
		String hql = "select uid from User where username = ?";
		Object[] params = {uname};
		List<Integer> lst = hibernateTemplate.find(hql, params);
		int uid = lst.get(0);
		User user = (User) hibernateTemplate.get(User.class, uid);
		user.setLast_name(lname);
		hibernateTemplate.update(user);
		return 1;
	}

	public int updatePicture(String uname, String profilepic) {
		String hql = "select uid from User where username = ?";
		Object[] params = {uname};
		List<Integer> lst = hibernateTemplate.find(hql, params);
		int uid = lst.get(0);
		User user = (User) hibernateTemplate.get(User.class, uid);
		user.setProfile_pic(profilepic);
		hibernateTemplate.update(user);
		return 1;
	}


}
