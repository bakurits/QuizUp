package com.entity;

public class RuntimeScore {
int ques_id;
int selected;
int riightanswer;


public RuntimeScore() {
	// TODO Auto-generated constructor stub
}
public RuntimeScore(int ques_id, int selected, int riightanswer) {

	this.ques_id = ques_id;
	this.selected = selected;
	this.riightanswer = riightanswer;
}
public int getQues_id() {
	return ques_id;
}
public void setQues_id(int ques_id) {
	this.ques_id = ques_id;
}
public int getSelected() {
	return selected;
}
public void setSelected(int selected) {
	this.selected = selected;
}
public int getRiightanswer() {
	return riightanswer;
}
public void setRiightanswer(int riightanswer) {
	this.riightanswer = riightanswer;
}

}

