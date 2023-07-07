package com.herbmall.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.herbmall.db.ConnectionPoolMgr2;

public class MemberDAO {
	private ConnectionPoolMgr2 pool;

	public MemberDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int insertMember(MemberVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			//1,2
			con = pool.getConnection();
			
			//3
			String sql = "insert into member(no,userid,name,pwd,email,hp,zipcode,address,addressdetail) \r\n"
					+ "values(member_seq.nextval,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getUserid());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getHp());
			ps.setString(6, vo.getZipcode());
			ps.setString(7, vo.getAddress());
			ps.setString(8, vo.getAddressDetail());
			
			//4
			int cnt = ps.executeUpdate();
			System.out.println("회원정보 입력 결과 cnt : " + cnt + ", 매개변수 vo : " + vo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	/**
	 * 아이디 중복확인용 메서드
	 * @param userid
	 * @return
	 * @throws SQLException 
	 */
	public int duplicateID(String userid) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//1,2
			con = pool.getConnection();
			
			//3
			String sql = "select count(*) from member where userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			
			//4
			int result = 0;
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int count = rs.getInt(1);
				if(count>0) {	//이미 존재 - 사용불가
					result = MemberService.UNUSABLE_ID;
				}else {	//해당 아이디는 없다 - 사용가능
					result = MemberService.USABLE_ID;
				}
			}
			System.out.println("아이디 중복확인 결과, result = " + result 
					+ ", 매개변수 userid = " + userid);
			return result;
		} finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public int checkLogin(String userid, String pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//1,2
			con = pool.getConnection();
			
			//3.
			String sql = "select pwd from member where userid=? and outdate is null";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			
			//4.
			rs = ps.executeQuery();
			int result = 0;
			
			if(rs.next()) {
				String dbPwd = rs.getString(1);
				if(dbPwd.equals(pwd)) {
					result = MemberService.LOGIN_OK;	//로그인 성공
				}else {
					result = MemberService.DISAGREE_PWD; //비밀번호 불일치
				}
			}else {
				result = MemberService.NONE_ID;	//해당아이디 없음
			}
			System.out.println("로그인 처리 결과, result = " + result + 
					", 매개변수 userid = " + userid + ", pwd = " + pwd);
			return result;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public MemberVO selectMember(String userid) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//1,2
			con = pool.getConnection();
			
			//3
			String sql = "select * from member where userid = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			
			//4
			rs = ps.executeQuery();
			MemberVO vo = new MemberVO();
			if(rs.next()) {
				int no = rs.getInt("no"); 
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String email = rs.getString("email");
				String hp = rs.getString("hp");
				String zipcode = rs.getString("zipcode");
				String address = rs.getString("address");
				String addressdetail = rs.getString("addressdetail");
				Timestamp regdate = rs.getTimestamp("regdate");
				int mileage = rs.getInt("mileage");
				Timestamp outdate = rs.getTimestamp("outdate");
				
				vo = new MemberVO(no, userid, name, pwd, email, hp, zipcode, address, addressdetail, regdate, mileage, outdate);
			}
			System.out.println("id로 검색 결과 vo : " + vo + ", 매개변수 userid : " + userid );
			
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int updateMember(MemberVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			//1,2
			con = pool.getConnection();
			
			//3
			String sql = "update member"
					+ " set"
					+ " email = ?, hp = ?, zipcode = ?, address = ?, addressdetail = ?"
					+ " where userid = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getEmail());
			ps.setString(2, vo.getHp());
			ps.setString(3, vo.getZipcode());
			ps.setString(4, vo.getAddress());
			ps.setString(5, vo.getAddressDetail());
			ps.setString(6, vo.getUserid());
			
			//4
			int cnt = ps.executeUpdate();
			
			System.out.println("정보 수정 결과 cnt : " + cnt + ", 매개변수 vo : " + vo);
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateOutdate(String userid) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "update member "
					+ " set outdate = sysdate"
					+ " where userid = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("탈퇴 처리 결과 cnt : " + cnt + ", 매개변수 userid " + userid);
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	
}
