package com.board.model;

import java.sql.SQLException;
import java.util.List;

public class BoardService {
	private BoardDAO boardDao;
	
	//게시판 페이징 처리 관련 상수
	public static final int PAGE_SIZE = 5;
	public static final int BLOCK_SIZE = 10;
	
	public BoardService() {
		boardDao = new BoardDAO();
	}

	public List<BoardVO> mainNotice() throws SQLException {
		return boardDao.mainNotice();
	}
	
	public int insertBoard(BoardVO vo) throws SQLException {
		return boardDao.insertBoard(vo);
	}
	
	public List<BoardVO> selectAll(String keyword, String condition) throws SQLException{
		return boardDao.selectAll(keyword, condition);
	}
	
	public int updateReadCount(int no) throws SQLException {
		return boardDao.updateReadCount(no);
	}

	public BoardVO selectByNo(int no) throws SQLException {
		return boardDao.selectByNo(no);
	}
	
	public int updateBoard(BoardVO vo) throws SQLException {
		return boardDao.updateBoard(vo);
	}
	
	public boolean checkPwd(int no, String pwd) throws SQLException {
		return boardDao.checkPwd(no, pwd);
	}
	
	public int deleteBoard(int no, String pwd) throws SQLException {
		return boardDao.deleteBoard(no, pwd);
	}
	
}
