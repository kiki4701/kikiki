package com.pd.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.db.ConnectionPoolMgr;
import com.db.ConnectionPoolMgr2;

public class PdDAO {
	private ConnectionPoolMgr2 pool;
	
	public PdDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	//[1] 입력, 수정의 경우 매개변수가 DTO인 메서드 이용
	public int insertPd(PdDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			//1,2
			con = pool.getConnection();
			
			//3.
			String sql = "insert into pd(no, pdName, price)"
					+ "values(pd_seq.nextval, ?, ?)";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, dto.getPdName());
			ps.setInt(2, dto.getPrice());
			
			//4. 
			int cnt = ps.executeUpdate();
			System.out.println("상품 등록 결과, cnt = " + cnt + ", 매개변수 dto = " + dto);
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	//[2] select한 결과 레코드가 1개인 경우 반환타입이 DTO인 메서드 이용
	public PdDTO selectByNo(int no) throws SQLException {
		//번호로 조회
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		PdDTO dto = new PdDTO();
		try {
		//1,2
		con = pool.getConnection();
		
		//3
		String sql = "select * from pd where no =?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		
		//4.
		rs = ps.executeQuery();
		if(rs.next()) {
			String pdName = rs.getString("pdname");
			int price = rs.getInt("price");
			Timestamp regdate = rs.getTimestamp("regdate");
			
			//레코드 하나는 하나의 DTO
			//하나의 레코드를 DTO로 묶어서 리턴한다
			dto.setNo(no);
			dto.setPdName(pdName);
			dto.setPrice(price);
			dto.setRegdate(regdate);
		}
		System.out.println("번호로 조회 결과, dto = " + dto + ", 매개변수 no = " + no);
		return dto;
		
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//[3] select한 결과 레코드가 여러 개인 경우 반환타입이 List<DTO>인 메서드 이용
	public List<PdDTO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		//여러 개의 레코드를 List로 묶어서 리턴
		List<PdDTO> list = new ArrayList<>();
		try {
			//1,2
			con = pool.getConnection();
			
			//3.
			String sql = "select * from pd order by no desc";
			ps = con.prepareStatement(sql);
			
			//4.
			rs = ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt(1);
				String pdName = rs.getString(2);
				int price = rs.getInt(3);
				Timestamp regdate = rs.getTimestamp(4);
				
				//[1] 먼저 한 개의 레코드를 DTO로 묶어준다
				PdDTO dto = new PdDTO(no, pdName, price, regdate);
				
				//[2] 각각의 DTO를 List로 묶어서 리턴한다
				list.add(dto);
			}
			System.out.println("상품전체 조회 결과, list.size = " + list.size());
			
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int updatePd(PdDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			//1,2
			con = pool.getConnection();
			
			//3
			String sql = "update pd"
					+ " set pdname = ?, price = ?"
					+ " where no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPdName());
			ps.setInt(2, dto.getPrice());
			ps.setInt(3, dto.getNo());
			
			//4
			int cnt = ps.executeUpdate();
			System.out.println("상품 수정 결과, cnt = " + cnt + ", 매개변수 dto = " + dto);
			
			return cnt;
			
		} finally {
			pool.dbClose(ps, con);
		}
		
	}
	
	public int deletePd(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			//1,2
			con = pool.getConnection();
		
			//3
			String sql = "delete from pd where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4.
			int cnt = ps.executeUpdate();
			System.out.println("상품 삭제 결과, cnt = " + cnt + ", 삭제 된 번호 = " + no);
			
			return cnt;
		
		} finally {
			pool.dbClose(ps, con);
		}
				
	}

	
}
