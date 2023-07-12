package com.web.book.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.book.model.BookDTO;
import com.web.book.model.BookService;

@Controller
public class BookListController {
	private BookService bookService;

	public BookListController() {
		System.out.println("생성자 - BookListController");
	}

	//DI - setter에 의한 종속객체 주입
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
		System.out.println("setter()호출 - BookListController : setBookService()");
	}
	
	@RequestMapping("book/bookList.do")
	//반환값이 있어서 매개변수에 model 넣어줌
	public String bookList(Model model) {
		//1
		System.out.println("책 목록 보여주기");
		
		//2
		List<BookDTO> list = null;
		
		try {
			list = bookService.selectAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//3
		model.addAttribute("list", list);
		
		//4
		return "book/bookList";
	}
	
	
}
