package com.tips.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.tips.model.TravelExpert;

public class TravelController2 implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//1. 파라미터 읽어오기
		String city = request.getParameter("city");
		
		//2. 비즈니스 로직 처리(db작업) - 모델에 의뢰
		TravelExpert model = new TravelExpert();
		String result = model.getTip(city);
		
		//3. 결과 저장
		request.setAttribute("result", result);
		
		//4. 뷰 페이지로 포워드 (action의 역할을 하는 forward)
		String viewPage	= "/tips/travelResult.jsp";
		return viewPage;
	}

	@Override
	public boolean isRedirect() {
		
		return false; //forward 하라는뜻
	}

}
