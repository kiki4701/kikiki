package com.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardService;
import com.board.model.BoardVO;
import com.controller.Controller;

public class EditController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		 6. 수정 페이지 보여주기(수정 화면)
			/board/edit.do => DispatcherServlet => EditController
			=> write.jsp 로 forward 
		 */
		//1 파라미터
		String no = request.getParameter("no");
		
		if(no == null || no.isEmpty()) {
			request.setAttribute("msg", "잘못된 url 입니다.");
			request.setAttribute("url", "/board/list.do");
			
			return "/common/message.jsp";
		}
		
		//2 db
		BoardService service = new BoardService();
		BoardVO vo = null;
		try {
			vo = service.selectByNo(Integer.parseInt(no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		//3 결과 저장
		request.setAttribute("vo", vo);
		
		//4 뷰페이지
		return "/board/write.jsp";
	
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
