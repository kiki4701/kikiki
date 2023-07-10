package com.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardService;
import com.board.model.BoardVO;
import com.controller.Controller;

public class EditOkController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		 7. 수정 처리(기존 - edit_ok.jsp)
			/board/edit_ok.do=>DispatcherServlet => EditOkController
			=> message.jsp로 forward
		*/
		//1 파라미터 받기
		String no = request.getParameter("no");
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		
		//2 db작업
		BoardVO vo = new BoardVO();
		vo.setNo(Integer.parseInt(no));
		vo.setTitle(title);
		vo.setName(name);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setContent(content);
		
		BoardService service = new BoardService();
		
		String msg = "글 수정 실패", url = "/board/edit.do?no="+no;
		try {
			if(service.checkPwd(Integer.parseInt(no), pwd)) {
				int cnt = service.updateBoard(vo);
				
				if(cnt > 0) {
					msg = "글 수정 성공";
					url = "/board/detail.do?no="+no;
				}
			}else {
				msg = "비밀번호가 틀렸습니다.";
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
