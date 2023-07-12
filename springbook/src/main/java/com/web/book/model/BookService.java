package com.web.book.model;

import java.sql.SQLException;
import java.util.List;

public interface BookService {
	public int insertBook(BookDTO dto) throws SQLException;
	public List<BookDTO> selectAll() throws SQLException;
	public BookDTO selectByNo(int no) throws SQLException;
	public int deleteBook(int no) throws SQLException;
}
