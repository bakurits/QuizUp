package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.entity.Admin;
import com.entity.User;

public class ValidateDaoImpl implements ValidationDaoI{

	
	private HibernateTemplate hibernateTemplate;
	
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate1) {
		this.hibernateTemplate = hibernateTemplate1;
	}


	@Override
	public User validateUser(String name, String pass) {
		
		String hql="from User where username=? and password=?";
		Object[] params={name,pass};
		List<User> lst=hibernateTemplate.find(hql,params);
		if(lst.size()!=0)
			return lst.get(0);
		return null;
	}


	@Override
	public Admin validateAdmin(String name, String pass) {
		
		String hql="from Admin where password=?";
		Object[] params={pass};
		List<Admin> lst=hibernateTemplate.find(hql,params);
		if(lst.size()!=0)
			return lst.get(0);
		return null;
	}


	@Override
	public void addAdmin(Admin admin) {
		
		hibernateTemplate.save(admin);
		System.out.println("Done");
	}
	
	
	@Override
	public Map<String,List<Integer[]>> performance(int user_id) {
		// TODO Auto-generated method stub
		String hql = "select category_name from Category";
		System.out.println(hql);
		List<String> list = hibernateTemplate.find(hql);
		List<String> randlist = new ArrayList<String>();
		Map<String,List<Integer[]>> map = new HashMap<>();
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
			String hql2 = "select count(*), max(score), min(score) from ScoreCard where user_id = ? and category_name = ?";
			for(String s:randlist)
			{
				Object[] params = {user_id,s};
			
			List<Integer[]> lst = (List<Integer[]>)hibernateTemplate.find(hql2,params);
			map.put(s,lst);
			}
			/*System.out.println("***********");
			System.out.println("***************"+map);*/
			//System.out.println(lst.get(0));
			
			//map.put("Sports",flist);
			return map;
	}
	
	
}
