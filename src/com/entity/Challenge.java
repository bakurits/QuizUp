package com.entity;

public class Challenge {

	private int challenge_id;
	private int challenger_id;
	private int challengee_id;
	private String questions_id;
	private int score1;
	private int score2;
	private int winner_id;
	private int completion;
	
	public int getChallenge_id() {
		return challenge_id;
	}
	public void setChallenge_id(int challenge_id) {
		this.challenge_id = challenge_id;
	}
	public int getChallenger_id() {
		return challenger_id;
	}
	public void setChallenger_id(int challenger_id) {
		this.challenger_id = challenger_id;
	}
	public int getChallengee_id() {
		return challengee_id;
	}
	public void setChallengee_id(int challengee_id) {
		this.challengee_id = challengee_id;
	}
	public String getQuestions_id() {
		return questions_id;
	}
	public void setQuestions_id(String questions_id) {
		this.questions_id = questions_id;
	}
	public int getScore1() {
		return score1;
	}
	public void setScore1(int score1) {
		this.score1 = score1;
	}
	public int getScore2() {
		return score2;
	}
	public void setScore2(int score2) {
		this.score2 = score2;
	}
	public int getWinner_id() {
		return winner_id;
	}
	public void setWinner_id(int winner_id) {
		this.winner_id = winner_id;
	}
	public int getCompletion() {
		return completion;
	}
	public void setCompletion(int completion) {
		this.completion = completion;
	}
	
}
