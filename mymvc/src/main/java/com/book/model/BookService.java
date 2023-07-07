package com.book.model;

import java.sql.SQLException;
import java.util.List;

public class BookService {
	private BookDAO bookDao;
	
	public BookService() {
		bookDao = new BookDAO();
	}

	public int insertBook(BookDTO dto) throws SQLException { //입력
		return bookDao.insertBook(dto);
	}
	
	public List<BookDTO> selectAll() throws SQLException  { //전체조회 db작업
		return bookDao.selectAll();
	}
}
