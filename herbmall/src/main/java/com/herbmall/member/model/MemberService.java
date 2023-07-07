package com.herbmall.member.model;

import java.sql.SQLException;

/*
 jsp - dao 
 jsp - service - dao 
 */

//service는 db작업 이외의 로직을 담는 클래스
//jsp와 dao를 연결해주는 역할(jsp와 dao를 바로 연결하는건 좋지 않다)

public class MemberService {
	
	//아이디 중복확인 관련 상수
	public static final int USABLE_ID=1;	//사용가능
	public static final int UNUSABLE_ID=2;	//이미 존재, 사용불가
	
	//로그인 처리 관련 상수
	public static final int LOGIN_OK=1;	//로그인 성공
	public static final int DISAGREE_PWD=2;	//비밀번호 불일치
	public static final int NONE_ID=3;	//해당 아이디가 존재하지 않는다
	
	private MemberDAO memberDao;
	
	public MemberService() {
		memberDao = new MemberDAO();
	}
	
	public int insertMember(MemberVO vo) throws SQLException {
		int cnt = memberDao.insertMember(vo);
		return cnt;
	}
	
	public int duplicateID(String userid) throws SQLException {
		return memberDao.duplicateID(userid);
	}
	
	public int checkLogin(String userid, String pwd) throws SQLException {
		return memberDao.checkLogin(userid, pwd);
	}
	
	public MemberVO selectMember(String userid) throws SQLException {
		return memberDao.selectMember(userid);
	}
	
	public int updateMember(MemberVO vo) throws SQLException {
		return memberDao.updateMember(vo);
	}
	
	public int updateOutdate(String userid) throws SQLException {
		return memberDao.updateOutdate(userid);
	}
	
}
