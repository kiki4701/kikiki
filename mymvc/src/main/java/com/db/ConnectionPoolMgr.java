package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionPoolMgr {
	
	public ConnectionPoolMgr() {
		//1. 드라이버 로딩
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println("드라이버 로딩 성공");
			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로딩 실패");
				e.printStackTrace();
			}
	}
	
	public Connection getConnection(String url, String user, String upwd) throws SQLException {
		//2. db서버에 연결하기 위한 Connection객체 생성
		Connection con = DriverManager.getConnection(url, user, upwd);
		return con;
	}
	
	public Connection getConnection() throws SQLException {
		//2. db서버에 연결하기 위한 Connection객체 생성
		String url="jdbc:oracle:thin:@DESKTOP-O03MT84:1521:xe";
		String user="herb", upwd="herb123";
		Connection con = DriverManager.getConnection(url, user, upwd);
		return con;
	}
	public Connection getConnection(String user, String upwd) throws SQLException {
		String url="jdbc:oracle:thin:@DESKTOP-O03MT84:1521:xe";
		Connection con = DriverManager.getConnection(url, user, upwd);
		return con;
	}
	
	public void dbClose(PreparedStatement ps, Connection con) throws SQLException {
		if(ps!=null) ps.close();
		if(con!=null) con.close();
	}
	
	public void dbClose(ResultSet rs, PreparedStatement ps, Connection con) throws SQLException {
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(con!=null) con.close();
	}
	
	
	
	
	
	
	
	
	
}
