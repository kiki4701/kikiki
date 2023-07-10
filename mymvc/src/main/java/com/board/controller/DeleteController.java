package com.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class DeleteController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		  8. 삭제 화면 보여주기
			/board/delete.do => DispatcherServlet => DeleteController
			=> delete.jsp 로 forward
		 */
		//1 파라미터
		String no = request.getParameter("no");
		
		if(no == null || no.isEmpty()) {
			request.setAttribute("msg", "잘못된 URL입니다.");
			request.setAttribute("url", "/board/list.do");

			return "/common/message.jsp";
		}
		//2 db
		//3 결과 저장
		//4 뷰페이지 반환
		return "/board/delete.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
