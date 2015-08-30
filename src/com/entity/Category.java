package com.entity;


public class Category {

	private int category_id;
	private String category_name;
	private String category_logo;
	private String category_desc;
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_logo() {
		return category_logo;
	}
	public void setCategory_logo(String category_logo) {
		this.category_logo = category_logo;
	}
	public String getCategory_desc() {
		return category_desc;
	}
	public void setCategory_desc(String category_desc) {
		this.category_desc = category_desc;
	}
	@Override
	public String toString() {
		return "Category [category_id=" + category_id + ", category_name="
				+ category_name + ", category_logo=" + category_logo
				+ ", category_desc=" + category_desc + "]";
	}
		
	
	
}
