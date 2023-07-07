package com.tips.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.tips.model.BookExpert;

public class BookController2 implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//1. 파라미터 읽어오기
		String lang = request.getParameter("lang");
		
		//2. 비즈니스 로직 처리(db작업) - 모델에 의뢰
		BookExpert model = new BookExpert();
		String result = model.getTip(lang);
		
		//3. 결과 저장
		request.setAttribute("result", result);
		
		//4. 뷰 페이지 만들어서 리턴
		String viewPage = "/tips/bookResult.jsp";
		return viewPage;
	}

	@Override
	public boolean isRedirect() {
		
		return false; //forward 하라는 뜻
		
	}

}
