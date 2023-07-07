package com.tips.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tips.model.BookExpert;
import com.tips.model.TravelExpert;

//@WebServlet("/BookController")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//1. 파라미터 읽어오기
		String lang = request.getParameter("lang");
		
		//2. 비즈니스 로직 처리(db작업) - 모델에 의뢰
		BookExpert model = new BookExpert();
		String result = model.getTip(lang);
		
		//3. 결과 저장
		request.setAttribute("result", result);
		
		//4. 뷰 페이지로 포워드 (action의 역할을 하는 forward)
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("/tips/bookResult.jsp");
		dispatcher.forward(request, response);
	}

}

	/* 참고해서 공부하라고 web.xml에 있던거 옮겨놓은거 그냥
		<servlet>
	 * <servlet-name>msgController</servlet-name>
	 * <servlet-class>com.tips.controller.MessageController</servlet-class>
	 * </servlet> <servlet-mapping> <servlet-name>msgController</servlet-name>
	 * <url-pattern>/MsgController</url-pattern> </servlet-mapping>
	 * 
	 * <servlet> <servlet-name>trResult</servlet-name>
	 * <servlet-class>com.tips.controller.TravelController</servlet-class>
	 * </servlet> <servlet-mapping> <servlet-name>trResult</servlet-name>
	 * <url-pattern>/travel.do</url-pattern> </servlet-mapping>
	 * 
	 * <servlet> <servlet-name>bookResult</servlet-name>
	 * <servlet-class>com.tips.controller.BookController</servlet-class> </servlet>
	 * <servlet-mapping> <servlet-name>bookResult</servlet-name>
	 * <url-pattern>/book.do</url-pattern> </servlet-mapping>
	 */







