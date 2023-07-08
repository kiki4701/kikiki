package com.herbmall.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.herbmall.db.ConnectionPoolMgr2;

public class BoardDAO {
	private ConnectionPoolMgr2 pool;

	public BoardDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	/**
	 *  글 등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertBoard(BoardVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		//1,2
		try {
			con = pool.getConnection();
			
			//3
			String sql = "insert into board(no, name, pwd, title, email, readcount, content)"
					+"values(board_seq.nextval, ?, ?, ?, ?, ?, ?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getEmail());
			ps.setInt(5, vo.getReadcount());
			ps.setString(6, vo.getContent());
			
			//4 결과 처리
			int cnt = ps.executeUpdate();
			
			if(cnt>0) {
				System.out.println("글쓰기, cnt : " + cnt + ", 매개변수 vo" + vo);
			}
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	/**
	 * 글 전체 보기 메서드
	 * @return
	 * @throws SQLException 
	 */
	
	public List<BoardVO> selectAll(String keyword, String condition) throws SQLException{
		/*
			 select * from board 
			 where name like '%이젠%'
			 
			 select * from board 
			 where title like '%연습장%';
			 
			 select * from board 
			 where content like '%없음%';
		 */
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//1,2
			con = pool.getConnection();
			
			//3
			String sql = "select * from board";
			//검색의 경우 where 조건절 추가
			if(keyword != null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? ||'%'";
			}		
			sql += " order by no desc";
			ps = con.prepareStatement(sql);
			
			if(keyword != null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			//4
			rs = ps.executeQuery();
			List<BoardVO> list = new ArrayList<>();
			while(rs.next()) {
				int no =rs.getInt("no");
				String name = rs.getString(2);
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				String email = rs.getString("email");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				String content = rs.getString("content");
				
				BoardVO vo = new BoardVO(no, name, pwd, title, email, regdate, readcount, content);
				
				list.add(vo);
			}
			System.out.println("글 전체 조회 결과, list.size :  " + list.size()
					+", 매개변수 keyword="+keyword+", condition="+condition);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * 글 상세보기 메서드
	 * @param no
	 * @return
	 * @throws SQLException 
	 */
	
	public BoardVO selectByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//1,2
			con = pool.getConnection();
			
			//3.
			String sql = "select * from board where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4.
			rs = ps.executeQuery();
			BoardVO vo = new BoardVO();
			
			if(rs.next()) {
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				String email = rs.getString("email");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				String content = rs.getString("content");
				
				vo.setName(name);
				vo.setPwd(pwd);
				vo.setTitle(title);
				vo.setEmail(email);
				vo.setRegdate(regdate);
				vo.setReadcount(readcount);
				vo.setContent(content);
			}
			System.out.println("번호로 조회 vo : " + vo + "매개변수 no : " + no);
			return vo;
			
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * 글 수정 메서드
	 * @param vo
	 * @return
	 * @throws SQLException 
	 */
	public int updateBoard(BoardVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			//1,2
			con = pool.getConnection();
			
			//3
			String sql = "update board "
					+ " set "
					+ " title = ?, name = ?, email = ?, content = ?"
					+ " where no = ? and pwd = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getEmail());
			ps.setString(4, vo.getContent());
			ps.setInt(5, vo.getNo());
			ps.setString(6, vo.getPwd());
			
			//4
			int cnt = ps.executeUpdate();
			
			System.out.println("수정 결과, cnt : "+ cnt + ", 매개변수 vo : " + vo);
			return cnt;
			
		} finally {
			pool.dbClose(ps, con);
		}
		
	}
	
	/**
	 * 글 삭제 메서드
	 * @param vo
	 * @return
	 * @throws SQLException 
	 */
	public int deleteBoard(int no, String pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			//1,2
			con = pool.getConnection();
			
			//3
			String sql = "delete from board\r\n"
					+ "where no = ? and pwd = ?";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, no);
			ps.setString(2, pwd);
			
			//4
			int cnt = ps.executeUpdate();
			
			System.out.println("삭제 처리 결과 : " + cnt);
			return cnt;
			
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	/**
	 * 조회수 세는 메서드
	 * @param no
	 * @return
	 * @throws SQLException 
	 */
	public int UpdateReadCount(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			//1,2
			con = pool.getConnection();
			
			//3
			String sql = "update board\r\n"
					+ "set \r\n"
					+ "readcount = readcount+1\r\n"
					+ "where no = ?";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, no);
			
			//4
			int cnt = ps.executeUpdate();
			System.out.println("조회수 증가 결과, cnt = " + cnt + ", 매개변수 no = " + no);
			return cnt;
			
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<BoardVO> mainNotice() throws SQLException {
		//최근글 6개만 조회
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<BoardVO> list = new ArrayList<>();
		try {
			//1,2
			con = pool.getConnection();
			
			//3
			String sql ="select * from \r\n"
					+ "(select * from board order by no desc)\r\n"
					+ "where rownum <= 6";
			ps = con.prepareStatement(sql);
			
			//4
			rs = ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				String email = rs.getString("email");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				String content = rs.getString("content");
				
				BoardVO vo = new BoardVO(no, name, pwd, title, email, regdate, readcount, content);
				
				list.add(vo);
			}
			System.out.println("mainNotice 실행 결과, list.size() : " + list.size());
			
			return list;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	
	
}
