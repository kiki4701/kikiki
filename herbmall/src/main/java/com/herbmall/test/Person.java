package com.herbmall.test;

public class Person {
	/*
	 싱글톤 패턴 - 인스턴스를 하나만 생성해서 사용하는 패턴 
	 */
	private static Person instance;	//static 변수는 중복해서 생성되지 않고, 공유한다는 특성 이용
	
	private Person() {
		
	}
	
	public static Person getInstance() {
		if(instance == null) 
			instance = new Person();
			/* null이면 new로 Person 인스턴스 생성 */
			
		return instance;
	}
	
	public void showInfo() {
		System.out.println("Person 메서드!");
	}
	
}
