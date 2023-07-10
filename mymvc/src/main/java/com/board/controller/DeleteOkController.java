package com.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardService;
import com.controller.Controller;

public class DeleteOkController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		  9. 삭제 처리
			/board/delete_ok.do => DispatcherServlet => DeleteOkController
			=> message.jsp 로 forward

		 */
		//1 파라미터 
		String no = request.getParameter("no");
		String pwd = request.getParameter("pwd");
		
		//2 db
		BoardService service = new BoardService();
		
		String msg = "글 삭제 실패", url = "/board/delete.do?no="+no;
		try {
			if(service.checkPwd(Integer.parseInt(no), pwd)) {
				int cnt = service.deleteBoard(Integer.parseInt(no), pwd);
			
				if(cnt > 0) {
					msg = "글 삭제 성공";
					url = "/board/list.do";
				}
			}else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		//3 결과 저장
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		//4 뷰페이지
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
