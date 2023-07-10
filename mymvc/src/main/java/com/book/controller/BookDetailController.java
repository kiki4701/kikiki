package com.book.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.model.BookDTO;
import com.book.model.BookService;
import com.controller.Controller;

public class BookDetailController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//1. 파라미터 받기
		String no = request.getParameter("no");
		System.out.println("bookdetail 파라미터 : " + no);
		
		if(no == null || no.isEmpty()) {
			request.setAttribute("msg", "잘못된 url 입니다.");
			request.setAttribute("url", "/book/bookList.do");
			
			return "/common/message.jsp";
		}
		
		//2. db작업
		BookService service = new BookService();
		BookDTO dto = null;
		
		try {
			dto = service.selectByNo(Integer.parseInt(no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		//3. 결과 저장
		request.setAttribute("dto", dto);
		
		//4. 뷰페이지 리턴 bookdetail.jsp로 포워드
		return "/book/bookDetail.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
	
	
}
