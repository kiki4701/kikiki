package com.tips.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tips.model.MessageModel;

//@WebServlet("/MessageController") //이제 매핑을 다 web.xml에서 할거라서 주석처리
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		requestPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		requestPro(request, response);
	}

	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자의 요청을 분석해서 요청에 따라 작업을 처리한 후 결과를 뷰인 jsp 페이지로 보냄
		//model2 이기 때문에 jsp를 직접 요청하지 않고 controller 를 요청한다.
		//(jsp 는 그냥 view 역할만하는 별거없는애)
		//http://localhost:9090/mymvc/MessageController?message=ki
		
		//1. 파라미터 읽어오기
		String message = request.getParameter("message");
		
		//2. 비즈니스 로직 처리(db작업) - 모델에 의뢰
		MessageModel model = new MessageModel();
		String result = model.proMessage(message);
		
		//3. 결과 저장
		request.setAttribute("result", result);
		
		//4. 뷰 페이지로 포워드 (action의 역할을 하는 forward)
		RequestDispatcher dispatcher //(view 에서 절대참조일때 contextpath를 자동으로 넣어주므로 /tips부터 시작한다)
			= request.getRequestDispatcher("/tips/messageView.jsp");
		dispatcher.forward(request, response);
		
		/*
		 [1] include 지시자, 액션 태그
		 [2] forward 액션태그, RequestDispatcher.forward
		 [3] web.xml
		 => 절대참조시 컨텍스트 경로가 자동으로 포함됨 */
		
	}
}
