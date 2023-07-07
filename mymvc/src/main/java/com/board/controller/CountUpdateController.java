package com.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardService;
import com.controller.Controller;

public class CountUpdateController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		  4. 조회수 증가 페이지(기존 countUpdate.jsp)
			/board/countUpdate.do => DispatcherServlet => CountUpdateController
			=> detail.do 로 redirect
		 */
		//1. 파라미터 받기
		String no = request.getParameter("no");
		
		//2. db처리
		BoardService service = new BoardService();
		
		try {
			int cnt = service.updateReadCount(Integer.parseInt(no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		//3. 결과 저장
		
		//4. 웹페이지 반환
		return "/board/detail.do?no="+no;
	}

	@Override
	public boolean isRedirect() {
		return true;
	}

}
