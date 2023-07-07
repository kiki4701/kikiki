package com.book.controller;

import java.io.File;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.model.BookDTO;
import com.book.model.BookService;
import com.controller.Controller;

public class BookWriteOkController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//1. 파라미터 받기
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String publisher = request.getParameter("publisher");
		
		//2. db작업
		BookDTO dto = new BookDTO();
		dto.setTitle(title);
		dto.setPrice(Integer.parseInt(price));
		dto.setPublisher(publisher);
		
		BookService bookService = new BookService();
		try {
			int cnt = bookService.insertBook(dto);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		//3. 결과 저장
		//4. 웹페이지 리턴 (완벽한 페이지를 .do로 리턴)
		return "/book/bookList.do";
	}

	@Override
	public boolean isRedirect() {
		return true;
	}
	
}
