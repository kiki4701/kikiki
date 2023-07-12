package com.web.book.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.book.model.BookDTO;
import com.web.book.model.BookService;

@Controller
public class BookWriteController {
	private BookService bookService;

	public BookWriteController() {
		System.out.println("생성자 - BookWriteController");
	}

	//DI - setter에 의한 종속객체 주입
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
		System.out.println("setter()호출 - BookWriteController : setBookService()");
	}
	
	@RequestMapping(value = "/book/bookWrite.do", method = RequestMethod.GET)
	public String bookWrite_get() {
		System.out.println("책 등록 화면 보여주기");
		
		return "book/bookWrite";
	}
	
	@RequestMapping(value = "/book/bookWrite.do", method = RequestMethod.POST)
	public String bookWrite_post(@ModelAttribute BookDTO dto) {
		//1 파라미터
		System.out.println("책 등록 처리, 파라미터 dto = " + dto);
		
		//2 db
		try {
			int cnt = bookService.insertBook(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//3 결과저장
		//4 뷰페이지
		return "redirect:/book/bookList.do";
	}
	
	
}
