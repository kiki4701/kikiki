package com.tips.model;

public class BookExpert {
	public String getTip(String lang) {
		String result = "";
		if(lang.equals("java")) {
			result = "이것이 자바다"	;
		}else if(lang.equals("jsp")) {
			result = "jsp 2.3 웹 프로그래밍";
		}else if(lang.equals("파이썬")) {
			result = "한권으로 끝내는 파이썬";
		}else if(lang.equals("리액트")) {
			result = "처음 만난 리액트";
		}
		
		return result;
	}
}
