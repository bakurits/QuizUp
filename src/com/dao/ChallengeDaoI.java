package com.dao;

import java.util.List;

import com.entity.QuestionBank;
import com.entity.User;

public interface ChallengeDaoI {

	public List<String> viewCategories();
	public List<String> viewUsers(int uid);
	public void setScore1(int uid,int score,int category);
	public Integer getUserId(String username);
	//public HibernateTemplate getHtemp();
	public List<QuestionBank> viewQuestionByCat(String category);
	public void setChallenge(int challenge_id, int challenger_id,int challengee_id,
			String questions_id,int score1, int score2, int winner_id,int completion);
	public List<String> getChallenge(int uid);
	public String getWinner(int uid,int challengerId,int score);
	public User getChallenger(String challengerName);
}
