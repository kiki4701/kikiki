package com.herbmall.reboard.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.herbmall.db.ConnectionPoolMgr2;

public class ReBoardDAO {
	private ConnectionPoolMgr2 pool;

	public ReBoardDAO() {
		pool= new ConnectionPoolMgr2();
	}

	/**
	 * 글 등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException 
	 */
	public int insertReBoard(ReBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2 con
			con=pool.getConnection();

			//3. ps
			String sql="insert into reBoard(no, name, pwd, title, email, content, "
					+ "groupno, filename, filesize, originalFileName)"
					+ " values(reBoard_seq.nextval, ?,?,?,?,?,reBoard_seq.nextval,"
					+ "?, ?, ?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getContent());
			ps.setString(6, vo.getFileName());
			ps.setLong(7, vo.getFileSize());
			ps.setString(8, vo.getOriginalFileName());

			//4 exec
			int cnt=ps.executeUpdate();
			System.out.println("글쓰기, cnt="+cnt +", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	/**
	 * 글 전체 보기 메서드
	 * @return
	 * @throws SQLException 
	 */
	public List<ReBoardVO> selectAll(String keyword, String condition) throws SQLException{
		/*
		 	select * from reBoard
			where name like '%길%';
			
			select * from reBoard
			where title like '%안%';
			
			select * from reBoard
			where content like '%가%';
		*/
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<ReBoardVO> list = new ArrayList<>();
		try {
			//1,2
			con=pool.getConnection();

			String sql="select * from reBoard ";
			//검색의 경우 where 조건절 추가
			if(keyword != null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql += " order by groupno desc, sortno";
			ps=con.prepareStatement(sql);

			if(keyword != null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String name=rs.getString("name");
				String pwd=rs.getString("pwd");
				String title=rs.getString("title");
				String email=rs.getString("email");
				Timestamp regdate=rs.getTimestamp("regdate");
				int readcount=rs.getInt("readcount");
				String content=rs.getString("content");
				//
				int groupNo=rs.getInt("groupno");
				int step=rs.getInt("step");
				int sortNo=rs.getInt("sortno");
				String delFlag=rs.getString("delflag");
				//
				String fileName = rs.getString("fileName");
				long fileSize = rs.getLong("fileSize");
				int downCount = rs.getInt("downCount");
				String originalFileName = rs.getString("originalFileName");

				ReBoardVO vo
				= new ReBoardVO(no, name, pwd, title, email, regdate, readcount, content, groupNo, step, sortNo, delFlag, fileName, fileSize, downCount, originalFileName); 
				

				list.add(vo);
			}
			System.out.println("글 전체 조회 결과, list.size="+list.size()
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
	public ReBoardVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		ReBoardVO vo = new ReBoardVO();
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from reBoard where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);

			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				String name=rs.getString("name");
				String pwd=rs.getString("pwd");
				String title=rs.getString("title");
				String email=rs.getString("email");
				String content=rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				//
				int groupNo=rs.getInt("groupno");
				int step=rs.getInt("step");
				int sortNo=rs.getInt("sortno");
				String delFlag=rs.getString("delflag");
				//
				String fileName = rs.getString("fileName");
				long fileSize = rs.getLong("fileSize");
				int downCount = rs.getInt("downCount");
				String originalFileName = rs.getString("originalFileName");
				
				vo.setContent(content);
				vo.setEmail(email);
				vo.setName(name);
				vo.setNo(no);
				vo.setPwd(pwd);
				vo.setReadcount(readcount);
				vo.setRegdate(regdate);
				vo.setTitle(title);
				//
				vo.setGroupNo(groupNo);
				vo.setStep(step);
				vo.setSortNo(sortNo);
				vo.setDelFlag(delFlag);
				//
				vo.setFileName(fileName);
				vo.setFileSize(fileSize);
				vo.setDownCount(downCount);
				vo.setOriginalFileName(originalFileName);
			}//if

			System.out.println("글 상세보기 결과, vo="+vo+", 매개변수 no=" + no);
			return vo;	
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	/**
	 * 글 수정 메서드
	 * @param vo
	 * @return
	 * @throws SQLException 
	 */
	public int updateReBoard(ReBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql = "update reBoard"
					+ " set title= ?, name =?, email= ?,content = ?"
					+ " where no= ?";
			ps = con.prepareStatement(sql);

			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getEmail());
			ps.setString(4, vo.getContent());
			ps.setInt(5, vo.getNo());

			//4
			int cnt = ps.executeUpdate();
			System.out.println("글수정 결과 cnt = " + cnt + ", 매개변수 vo = " + vo);
			

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public boolean checkPwd(int no, String pwd) throws SQLException {
		
		//비밀번호 일치여부 체크하기
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			con = pool.getConnection();
			
			String sql = "select pwd from reboard where no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbPwd = rs.getString("pwd");
				if(dbPwd.equals(pwd)) {
					result = true;
				}
			}
			System.out.println("비밀번호 일치여부 체크 결과 : " + result);
			
			return result;
		} finally {
			pool.dbClose(rs, ps, con);
		}
		
	}

	public void deleteReBoard(ReBoardVO vo) throws SQLException {
		/*
		create or replace procedure deleteReboard --프로시저 이름 
		(
		--매개변수
		    m_no number,
		    m_step number,
		    m_groupno number
		)
		is
		--변수선언부
		    cnt number;
		begin
		
		    --답변이 있는 원본글인 경우에는 레코드를 삭제하지 말고 DelFlag = "Y"로 update
		
		    --원본글인 경우
		    if m_step = 0 then
		        --답변글이 존재하는지 체크
		        select count(*) into cnt from reboard
		        where groupNo = m_groupno;
		
		        --답변글이 존재하는 경우
		        if cnt > 1 then
		            update reboard set DelFlag = 'Y'
		            where no = m_no;
		        else --답변글이 없는 경우
		            delete reboard where no = m_no;
		        end if;
		    else --답변글 자체인 경우
		        delete reboard where no = m_no;
		    end if;
		
		    commit;
		
		
		EXCEPTION
		    WHEN OTHERS THEN
		        raise_application_error(-20001, '글 삭제 실패!');
		        ROLLBACK;
		end;
		
		--exec deleteReboard(2, 3, 3)
		 */
		
		Connection con = null;
		CallableStatement ps = null;

		try {
			//1,2
			con = pool.getConnection();

			//3
			String sql = "call deleteReboard(?, ?, ?)";
			ps = con.prepareCall(sql);

			ps.setInt(1, vo.getNo());
			ps.setInt(2, vo.getStep());
			ps.setInt(3, vo.getGroupNo());

			//4
			boolean bool = ps.execute();
			
			System.out.println("삭제 처리 결과, bool : " + bool
					+", 매개변수 vo="+vo);
			
		} finally {
			pool.dbClose(ps, con);
		}
	}

	public int updateReadCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="update reBoard"
					+ " set readcount = readcount+1"
					+ " where no = ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4
			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과, cnt="+cnt+", 매개변수 no="+no);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int reply(ReBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		int cnt = 0;
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			con.setAutoCommit(false);	//자동커밋이 안되게 막는다
			
			//===트랜잭션 시작===
			
			//[1] update
			//insert하기 전에 sortNo를 위한 자리확보
			String sql="update reboard\r\n"
					+ "set \r\n"
					+ "sortno = sortno + 1\r\n"
					+ "where groupno = ? and sortno > ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getGroupNo());
			ps.setInt(2, vo.getSortNo());
			

			//4
			cnt=ps.executeUpdate();
			System.out.println("답변달기 - update 결과, cnt = " + cnt);
			
			//[2] insert
			sql = "insert into reboard(no, name, pwd, title, email, content, groupno, step, sortno)\r\n"
					+ "values(reboard_seq.nextval,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getContent());
			ps.setInt(6, vo.getGroupNo());
			ps.setInt(7, vo.getStep()+1);	//1증가
			ps.setInt(8, vo.getSortNo()+1);	
			
			//4
			cnt = ps.executeUpdate();
			System.out.println("답변달기 - insert 결과, cnt = " + cnt + ", 매개변수 vo = " + vo);
			
			con.commit();
			//----------트랜잭션 성공, 종료-----------
			
			}catch (SQLException e) {
				e.printStackTrace();
				con.rollback(); //트랜잭션 실패
			}finally {
				con.setAutoCommit(true);
				
				pool.dbClose(ps, con);
			}
		
			return cnt;
	}
	
	public int updateDownCount(int no)throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		try{
			con = pool.getConnection();
			
			String sql="update reboard set downcount = downcount+1 where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("다운로드수 증가 결과, cnt="+cnt+", 매개변수 no="+no);
			
			return cnt;
		}finally{
			pool.dbClose(ps, con);
		}
	}
		
}







