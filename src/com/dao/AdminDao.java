package com.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.entity.Admin;
import com.entity.Category;
import com.entity.Challenge;
import com.entity.QuestionBank;
import com.entity.ScoreCard;
import com.entity.User;

public class AdminDao implements AdminDaoI{


	private HibernateTemplate hibernateTemplate;
	
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	

	public Set<String> getCats() {
		// TODO Auto-generated method stub
		
		String hql="select category_name from Category";
	
	
		
		List<String> lst=hibernateTemplate.find(hql);
		Set<String> set=new HashSet<String>();
		set.addAll(lst);
		
		return set;
		
		
		
	}
	
	
	
	public List<QuestionBank> viewQuestionByCat(String category) {
		String hql="select category_id from Category where category_name=?";
		Object[] params={category};
		List<Integer> lst=hibernateTemplate.find(hql,params);
		String hql1="from QuestionBank where category_id=?";
		int id=lst.get(0);
		Object[] params2={id};
		List<QuestionBank> lst2=hibernateTemplate.find(hql1,params2);
		if(lst2.size()<10)
			return lst2;
		Random rand = new Random();
		 int e;
	        int i;
	        int g = 10;
	        HashSet<Integer> randomNumbers = new HashSet<Integer>();

	        for (i = 0; i < g; i++) {
	            e = rand.nextInt(lst2.size());
	            randomNumbers.add(e);
	            if (randomNumbers.size() <= 10) {
	                if (randomNumbers.size() == 10) {
	                   break;
	                }
	                g++;
	                randomNumbers.add(e);
	            }
	        }
	        List<QuestionBank> randlist=new ArrayList<QuestionBank>();
			for(int j:randomNumbers){
				randlist.add(lst2.get(j));
			}
			
			return randlist;
		
		
		
	}
	
	public int getMax() {
		String hql="select max(s_id) from ScoreCard";
		List<Integer> lst=hibernateTemplate.find(hql);
		if(lst.get(0)==null)
			return 0;
		return lst.get(0);
		
	}

	public int getMax1() {
		String hql="select max(challenge_id) from Challenge";
		List<Integer> lst=hibernateTemplate.find(hql);
		if(lst.get(0)==null)
			return 0;
		return lst.get(0);
		
	}
	
	public String getCat(int id){
		String hql="select category_name from Category where category_id=?";
		Object[] params={id};
		List<String> lst=hibernateTemplate.find(hql,params);
		return lst.get(0);
	}
	
	public int getCati(String name){
		String hql="select category_id from Category where category_name=?";
		Object[] params={name};
		List<Integer> lst=hibernateTemplate.find(hql,params);
		return lst.get(0);
	}
	
	public int saveemp(ScoreCard sc) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(sc);
		return 1;
	}
	
	public int saveemp1(Challenge c) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(c);
		return 1;
	}
	public int updateemp1(Challenge c) {
		// TODO Auto-generated method stub
		hibernateTemplate.update(c);
		return 1;
	}
	@Override
	public int addQues(QuestionBank q) {
		hibernateTemplate.save(q);
		return 1;
	}

	@Override
	public int modifyQues(int ques_id,  String question,
			String option1, String option2, String option3, String option4,
			int right_answer) {
		// TODO Auto-generated method stub
		QuestionBank q = (QuestionBank)hibernateTemplate.get(QuestionBank.class, ques_id);
		
		q.setOption1(option1);
		q.setOption2(option2);
		q.setOption3(option3);
		q.setOption4(option4);
		q.setQuestion(question);
		q.setRight_answer(right_answer);
		hibernateTemplate.update(q);

		return 0;
	}

	@Override
	public int deleteQues(int ques_id) {
		// TODO Auto-generated method stub
		QuestionBank q=(QuestionBank)hibernateTemplate.get(QuestionBank.class, ques_id);
		hibernateTemplate.delete(q);
		return 1;
	}

	@Override
	public int addCategory(int cat_id, String cat_name, String cat_logo,
			String cat_desc) {
		// TODO Auto-generated method stub
		Category cat = new Category();
		cat.setCategory_desc(cat_desc);
		cat.setCategory_logo(cat_logo);
		cat.setCategory_name(cat_name);
		cat.setCategory_id(cat_id);
		hibernateTemplate.save(cat);
		return 1;
	}

	/*@Override
	public QuestionBank showQues(int ques_id) {
		// TODO Auto-generated method stub
		QuestionBank qb=(QuestionBank)hibernateTemplate.get(QuestionBank.class, ques_id);
		return qb;
	}*/

	@SuppressWarnings("unchecked")
	@Override
	public List<String> showCat() {
		// TODO Auto-generated method stub
		String hql = "select category_name from category";
		List<String> lst = hibernateTemplate.find(hql);
		return lst;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<QuestionBank> allQuesInCat(int cat_id) {
		// TODO Auto-generated method stub
		String hql = "from question_bank where category_id=?";
		Object[] params = {cat_id};
		List<QuestionBank> lst = hibernateTemplate.find(hql,params);
		return lst;
	}

	@Override
	public int updatePassword(int admin_id, String pass) {
		// TODO Auto-generated method stub
		Admin admin=(Admin)hibernateTemplate.get(Admin.class, admin_id);
		admin.setPassword(pass);
		hibernateTemplate.update(admin);
		return 1;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int maxKey(String table_name, String id) {
		// TODO Auto-generated method stub
		String hql = "select max ("+id+") from "+table_name+"";
		List<Integer> lst = hibernateTemplate.find(hql);
		if(lst == null||lst.get(0)==null) return 0;
		return lst.get(0);
	}

	@Override
	public QuestionBank showQues(String question) {
		// TODO Auto-generated method stub
		String hql="from QuestionBank where question=?";
		Object[] params={question};
		List<QuestionBank> lst=hibernateTemplate.find(hql,params);
		return lst.get(0);
	}

	@Override
	public Set<String> getquestions() {
		// TODO Auto-generated method stub
String hql="select question from QuestionBank";
	
	
		
		List<String> lst=hibernateTemplate.find(hql);
		Set<String> set=new HashSet<String>();
		set.addAll(lst);
		
		return set;
		
	}
	
	public User getuser(int id){
		User user=(User)hibernateTemplate.get(User.class, id);
		return user;
	}

	@Override
	public int modifyuser(int id, String email, String password) {
		// TODO Auto-generated method stub
User u = (User)hibernateTemplate.get(User.class, id);
		
u.setEmail(email);
u.setPassword(password);

	/*	q.setOption1(option1);
		q.setOption2(option2);
		q.setOption3(option3);
		q.setOption4(option4);
		q.setQuestion(question);
		q.setRight_answer(right_answer);*/
		hibernateTemplate.update(u);

		
		return 0;
	}

	@Override
	public Set<String> getusers(int id) {
		// TODO Auto-generated method stub
String hql="select username from User u where u.user_id not in(?) ";
Object[] params={id};
	
		
		List<String> lst=hibernateTemplate.find(hql,params);
		Set<String> set=new HashSet<String>();
		set.addAll(lst);
		
		return set;
	
	}

	@Override
	public List<Challenge> getthrownchallenges(int id) {
		// TODO Auto-generated method stub
		String hql="from Challenge where challenger_id = ?";
		Object[] params={id};
		List<Challenge> lst=hibernateTemplate.find(hql,params);
		return lst;
	}

	@Override
	public List<Challenge> getreceivechallenges(int id) {
		// TODO Auto-generated method stub
		String hql="from Challenge where challengee_id = ?";
		Object[] params={id};
		List<Challenge> lst=hibernateTemplate.find(hql,params);
		return lst;
	}

	@Override
	public QuestionBank getq(int ques_id) {
		// TODO Auto-generated method stub
		QuestionBank q=(QuestionBank)hibernateTemplate.get(QuestionBank.class,ques_id );
		return q;
	}

	@Override
	public Challenge getchallenge(int id) {
		// TODO Auto-generated method stub
		Challenge q=(Challenge)hibernateTemplate.get(Challenge.class,id );
		return q;
	}


}