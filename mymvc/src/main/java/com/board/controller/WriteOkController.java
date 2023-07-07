package com.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardService;
import com.board.model.BoardVO;
import com.controller.Controller;

public class WriteOkController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		  2. 글 등록 처리 (기존 write_ok.jsp)
			/board/write_ok.do => DispatcherServlet => WriteOkController
			=> list.do로 redirect
		 */
		//1
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String content = request.getParameter("content");

		//2
		BoardService service = new BoardService();

		BoardVO vo = new BoardVO();
		vo.setContent(content);
		vo.setEmail(email);
		vo.setName(name);
		vo.setPwd(pwd);
		vo.setTitle(title);

		try {
			int cnt = service.insertBoard(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//3
		//4
		return "/board/list.do";

	}

	@Override
	public boolean isRedirect() {
		return true;
	}

}
