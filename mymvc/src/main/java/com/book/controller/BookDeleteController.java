package com.book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.model.BookService;
import com.controller.Controller;

public class BookDeleteController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//파라미터 받기
		String no = request.getParameter("no");
		
		if(no == null || no.isEmpty()) {
			request.setAttribute("msg", "잘못된 url 입니다.");
			request.setAttribute("url", "/book/bookList.do");
			
			return "/common/message.jsp";
		}
		
		//db작업
		BookService service = new BookService();
		int cnt = service.deleteBook(Integer.parseInt(no));
		
		//결과 저장
		//뷰페이지 반환 /book/bookList.do 로 redirect
		return "/book/bookList.do";
	}

	@Override
	public boolean isRedirect() {
		return true;
	}

}
