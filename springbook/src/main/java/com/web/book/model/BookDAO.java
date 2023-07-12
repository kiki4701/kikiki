package com.web.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.web.db.ConnectionPoolMgr2;

public interface BookDAO {
	public int insertBook(BookDTO dto) throws SQLException;
	public List<BookDTO> selectAll() throws SQLException;
	public BookDTO selectByNo(int no) throws SQLException;
	public int deleteBook(int no) throws SQLException;
}//
