package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.entity.User;

public class RegistrationDaoImpl implements RegistrationDaoI{
	
private HibernateTemplate hibernateTemplate;
	


	public HibernateTemplate getHibernateTemplate() {
	return hibernateTemplate;
}



public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
	this.hibernateTemplate = hibernateTemplate;
}
/*public  Map<String,List<String>> getCategories(){
	String hql = "select category_name from Category";
	System.out.println(hql);
	List<String> list = hibernateTemplate.find(hql);
	List<String> randlist = new ArrayList<String>();
	if(list.size()<4)
	{
		for(String j:list){
			randlist.add(j);
		}
	}	
	else{
		Random rand = new Random();
		int e;
        int i;
        int g = 4;
        HashSet<Integer> randomNumbers = new HashSet<Integer>();

        for (i = 0; i < g; i++) {
            e = rand.nextInt(list.size());
            randomNumbers.add(e);
            if (randomNumbers.size() <= 4) {
               if (randomNumbers.size() == 4) {
                   
                	break;
                }
                g++;
                //randomNumbers.add(e);
            }
        }
		for(int j:randomNumbers){
			randlist.add(list.get(j));
		}
	}
		System.out.println("randomn"+randlist);
		String hql2 = "select u.first_name from User u, ScoreCard s where u.user_id=s.user_id and category_name = ?  order by score desc";
		//List<Map<String,List<String>>> lmap = new ArrayList<Map<String,List<String>>>();
		Map<String,List<String>> map=new HashMap<>();
		for(String s:randlist)
		{
			Object[] params1 = {s};
		
		List<String> flist = hibernateTemplate.find(hql2,params1);
		List<String> fflist = new ArrayList<String>();
		fflist.add(flist.get(0));
		fflist.add(flist.get(1));
		fflist.add(flist.get(2));
		System.out.println(flist);
		System.out.println(fflist);
		map.put(s,fflist);
		}
		return map;
	
}
*/

	public int addUser(int user_id, String username, String first_name, String last_name,String profile_pic,String email, String password) {
		/*
		String sql="insert into User values (?,?,?,?,?,?,?)";
		Object[] params ={user_id,username,first_name,last_name,null,email,password};
		hibernateTemplate.update(sql, params);
		*/
		User user = new User();
		user.setUser_id(user_id);
		user.setEmail(email);
		user.setFirst_name(first_name);
		user.setLast_name(last_name);
		user.setPassword(password);
		user.setProfile_pic(profile_pic);
		user.setUsername(username);
		hibernateTemplate.save(user);
		return 1;
	}
	
	public int maxKey(String table_name, String id) {
		// TODO Auto-generated method stub
		String hql = "select max ("+id+") from "+table_name+"";
		System.out.println(hql);
		List<Integer> lst = hibernateTemplate.find(hql);
		System.out.println(lst);
		System.out.println(lst.get(0));
		if(lst == null||lst.get(0)==null) return 0;
		return lst.get(0);
	}



}
