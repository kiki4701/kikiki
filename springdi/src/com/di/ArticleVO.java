package com.di;

public class ArticleVO {
	private int no;
	private String title;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "ArticleVO [no=" + no + ", title=" + title + "]";
	}
	
	
}
