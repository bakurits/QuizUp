package com.entity;

public class QuestionBank {

	private int ques_id;
	private int category_id;
	private String question;
	private String ques_image;
	private String ques_audio;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private int right_answer;

	public int getQues_id() {
		return ques_id;
	}

	public void setQues_id(int ques_id) {
		this.ques_id = ques_id;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getQues_image() {
		return ques_image;
	}

	public void setQues_image(String ques_image) {
		this.ques_image = ques_image;
	}

	public String getQues_audio() {
		return ques_audio;
	}

	public void setQues_audio(String ques_audio) {
		this.ques_audio = ques_audio;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public int getRight_answer() {
		return right_answer;
	}

	public void setRight_answer(int right_answer) {
		this.right_answer = right_answer;
	}

}
