package com.book.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.model.BookDTO;
import com.book.model.BookService;
import com.controller.Controller;

public class BookListController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//1
		//2. db
		BookService bookService = new BookService();
		List<BookDTO> list = null;
		
		try {
			list = bookService.selectAll();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		//3. 결과 저장
		request.setAttribute("list", list);
		
		//4. viewPage 반환
		String viewPage = "/book/bookList.jsp";
		return viewPage;
		
		
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
