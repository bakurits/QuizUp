package com.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.entity.Category;
import com.entity.Challenge;
import com.entity.QuestionBank;
import com.entity.ScoreCard;
import com.entity.User;

public class ChallengeDaoImpl implements ChallengeDaoI {

	private HibernateTemplate hibernateTemplate;
	
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate1) {
		this.hibernateTemplate = hibernateTemplate1;
	}

	@Override
	public List<String> viewCategories() {
		String hql = "select category_name from Category ";
		List<String> lst = hibernateTemplate.find(hql);
		return lst;
	}

	@Override
	public List<String> viewUsers(int uid) {
		String hql = "select username from User where user_id not in ?";
		Object[] params = { uid };
		List<String> lst = hibernateTemplate.find(hql, params);
		return lst;
	}
	
	
	public Integer getUserId(String username){
		String hql = "select user_id from User where username = ? ";
		Object[] params = {username};
		List<Integer> lst = hibernateTemplate.find(hql,params);
		return lst.get(0);
	}

	@Override
	public void setChallenge(int challenge_id, int challenger_id,int challengee_id,
			String questions_id,int score1,int score2,int winner_id,
	int completion) {
		Challenge ch = new Challenge();
		ch.setChallenge_id(challenge_id);
		ch.setChallengee_id(challengee_id);
		ch.setChallenger_id(challenger_id);
		ch.setCompletion(completion);
		ch.setQuestions_id(questions_id);
		ch.setScore1(score1);
		ch.setScore2(score2);
		ch.setWinner_id(winner_id);
		hibernateTemplate.save(ch);
	}

	@Override
	public void setScore1(int uid, int score, int category) {
		ScoreCard sc = new ScoreCard();
		//sc.setCategory_id(category);
		sc.setScore(score);
		Date date = new Date();
		String timestmp = date.toString();
		sc.setTimestamp(timestmp);
		sc.setUser_id(uid);
		hibernateTemplate.save(sc);
	}
	
	public List<QuestionBank> viewQuestionByCat(String category) {
		// TODO Auto-generated method stub
		  Random rand = new Random();
	        int e;
	        int i;
	        int g = 5;
	        HashSet<Integer> randomNumbers = new HashSet<Integer>();

	        for (i = 0; i < g; i++) {
	            e = rand.nextInt(10);
	            randomNumbers.add(e);
	            if (randomNumbers.size() <= 5) {
	                if (randomNumbers.size() == 5) {
	                    g = 5;
	                }
	                g++;
	                randomNumbers.add(e);
	            }
	        }
	        
	    	
	    	
	  
	        String hql="from Category c inner join fetch c.questions where c.category_name=?";
	        Object[] params={category};
	        List<Category> lst=hibernateTemplate.find(hql,params);
		
			
			
	        Set<QuestionBank> pset=null;
			Set<Category> set=new HashSet<Category>(lst);
			
			for(Category c:set){
				 //pset=c.getQuestions();
			}
	List<QuestionBank> mainlist=new ArrayList<QuestionBank>(pset);
		List<QuestionBank> randlist=new ArrayList<QuestionBank>();
		for(int j:randomNumbers){
			randlist.add(mainlist.get(j));
		}
		
		return randlist;
		
	}

	@Override
	public List<String> getChallenge(int uid) {
	
		String hql="select challenger_id from Challenge where challengee_id=? and completion=?";
		Object[] params={uid,false};
		List<Integer> lst=hibernateTemplate.find(hql,params);
		List<String> names=new ArrayList<String>();
		for(Integer i:lst){
			hql="select username from User where user_id=?";
			Object[] par={i};
			names.addAll(hibernateTemplate.find(hql,par));
		}
		return names;
	}

	@Override
	public String getWinner(int challenger_id,int challengee_id, int score2) {
		
		String hql="from Challenge where challenger_id=? and challengee_id=?";
		Object[] params={challenger_id,challengee_id};
		List<Challenge> lst=hibernateTemplate.find(hql,params);
		Challenge c=lst.get(0);
		int score1=c.getScore1(); int winnerId;
		if(score2>score1)
			winnerId=challengee_id;
		else if(score2<score1)
			winnerId=challenger_id;
		else
			winnerId=-1;
		c.setScore2(score2);
		c.setWinner_id(winnerId);
		c.setCompletion(1);
		hibernateTemplate.update(c);
		if(winnerId!=-1){
			hql="select username from User where user_id=?";
			Object[] params1={winnerId};
			List<String> lst1=hibernateTemplate.find(hql,params1);
			return lst1.get(0);
		}
		return "Tied";
	}

	
	@Override
	public User getChallenger(String challengerName) {
		
		User challenger=hibernateTemplate.get(User.class,challengerName);
		return challenger;
	}
	
	
	
}
