package com.dao;

import java.util.List;
import java.util.Set;

import com.entity.Challenge;
import com.entity.QuestionBank;
import com.entity.ScoreCard;
import com.entity.User;

public interface AdminDaoI {

	public int addQues(QuestionBank q);
	public int modifyQues(int ques_id,  String question, String option1, String option2, String option3, String option4, int right_answer);
	public int deleteQues(int ques_id);
	public int addCategory(int cat_id, String cat_name, String cat_logo, String cat_desc);
	public QuestionBank showQues(String question);
	public List<String> showCat();
	public List<QuestionBank> allQuesInCat(int cat_id);
	public int updatePassword(int admin_id, String pass);
	public int maxKey(String table_name, String id);
	public int modifyuser(int id,String email,String password);
	public List<Challenge> getthrownchallenges(int id);
	public List<Challenge> getreceivechallenges(int id);
	public QuestionBank getq(int id);
	public Challenge getchallenge(int id);
	public int updateemp1(Challenge c);

	public Set<String> getusers(int id);
	public Set<String> getCats();
	public Set<String> getquestions();
	public List<QuestionBank> viewQuestionByCat(String category);
	public int getMax();
	public int getMax1();
	public String getCat(int id);
	public int saveemp(ScoreCard sc);
	public int getCati(String name);
	public User getuser(int id);
}
