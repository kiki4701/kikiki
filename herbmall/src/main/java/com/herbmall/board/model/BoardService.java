package com.herbmall.board.model;

import java.sql.SQLException;
import java.util.List;

public class BoardService {
	private BoardDAO boardDao;
	
	public BoardService() {
		boardDao = new BoardDAO();
	}

	public List<BoardVO> mainNotice() throws SQLException {
		return boardDao.mainNotice();
	}
	

}
