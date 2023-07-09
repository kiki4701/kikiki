package com.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.db.ConnectionPoolMgr2;

public class BookDAO {
	private ConnectionPoolMgr2 pool;

	public BookDAO(){
		pool = new ConnectionPoolMgr2();
		System.out.println("BookDao 객체 생성");
	}

	public int insertBook(BookDTO dto) throws SQLException { //입력
		Connection con = null;
		PreparedStatement ps = null;
		System.out.println("insertbook 시작, 매개변수 : " + dto);
		
		try {
			//1,2.
			con = pool.getConnection();
			
			//3.
			String sql = "insert into book(no, title, publisher, price, joindate)"
					+ " values(book_seq.nextval, ?, ?, ?, sysdate)";
			ps = con.prepareStatement(sql);

			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getPublisher());
			ps.setInt(3, dto.getPrice());

			int cnt = ps.executeUpdate();
			System.out.println("입력 결과, cnt=" + cnt + ", 매개변수 vo=" + dto);

			return cnt;

		}finally {
			pool.dbClose(ps, con);
		}
	}

	public int deleteBook(int no) throws SQLException { //삭제
		Connection con = null;
		PreparedStatement ps = null;

		try {
			//1,2
			con = pool.getConnection();
			//3.
			String sql = "delete from book where no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);

			int cnt = ps.executeUpdate();
			System.out.println("삭제 결과, cnt=" + cnt + ", 매개변수=" + no);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	public BookDTO selectByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		BookDTO dto = new BookDTO();
		try {
			con = pool.getConnection();
			
			String sql = "select * from book where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				String title = rs.getString("title");
				int price = rs.getInt("price");
				String publisher = rs.getString("publisher");
				Timestamp joindate = rs.getTimestamp("joindate");

				dto.setNo(no);
				dto.setTitle(title);
				dto.setPrice(price);
				dto.setPublisher(publisher);
				dto.setJoindate(joindate);
			}
			System.out.println("번호로 검색결과: " + dto + ", 매개변수 no: " + no);
			return dto;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public BookDTO selectByTitle(String title) throws SQLException { //제목으로 조회
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		BookDTO dto = new BookDTO();

		try {
			//1,2
			con = pool.getConnection();
			//3.
			String sql = "select * from book where title=?";
			ps = con.prepareStatement(sql);

			ps.setString(1, title);
			rs = ps.executeQuery();
			if(rs.next()) { //하나의 레코드
				int no = rs.getInt("no");
				int price = rs.getInt("price");
				String publisher = rs.getString("publisher");
				Timestamp joindate = rs.getTimestamp("joindate");

				dto.setNo(no);
				dto.setTitle(title);
				dto.setPrice(price);
				dto.setPublisher(publisher);
				dto.setJoindate(joindate);
			}
			System.out.println("번호로 조회 결과, dto=" + dto + ", 매개변수=" + title);

			return dto;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public List<BookDTO> selectAll() throws SQLException  { //전체조회 db작업
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		//여러 개의 레코드를 List로 묶어서 리턴
		List<BookDTO> list = new ArrayList<>(); //부모(List)에 자식(ArrayList)을 넣는다

		//1,2
		try {
			con = pool.getConnection();

			//3. 
			String sql = "select no, title, price, publisher, joindate from book order by no";
			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();
			//DAO에서는 출력하지않는다.
			while(rs.next()) {
				int no = rs.getInt(1);
				String title = rs.getString(2);
				int price = rs.getInt(3);
				String publisher = rs.getString(4);
				Timestamp joindate = rs.getTimestamp(5);

				//[1] 먼저 한 개의 레코드를 DTO로 묶어준다
				BookDTO dto = new BookDTO(no, title, price, publisher, joindate); //PdDTO 객체를 생성해서 생성자에 다 넣어준다.

				//[2] 각각의 DTO를 List로 묶어서 리턴한다
				list.add(dto); //list에 dto(하나의 레코드)가 계속 추가되고있다
			}
			System.out.println("책 전체 조회 결과, list size=" + list.size());
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	


}//
