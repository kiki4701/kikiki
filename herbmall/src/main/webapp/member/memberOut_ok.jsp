<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/loginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberOut_ok</title>
</head>
<jsp:useBean id="memService" class="com.herbmall.member.model.MemberService" scope="session"></jsp:useBean>
<body>
<%
	//1 
	request.setCharacterEncoding("utf-8");

	String pwd = request.getParameter("pwd");
	String userid = (String)session.getAttribute("userid");
	
	//2 db
	String msg = "회원 탈퇴 실패", url = "memberOut.jsp";
	
	try{
		int check = memService.checkLogin(userid, pwd);
		if(check == memService.LOGIN_OK){
			int cnt = memService.updateOutdate(userid);
			
			if(cnt > 0){
				msg = "회원 탈퇴 완료";
				url = "../login/login.jsp";
				
				session.invalidate();
				Cookie ck = new Cookie("ck_userid", userid);
				ck.setPath("/");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}else{
				msg = "회원 탈퇴 실패";
			}
			
		}else if(check == memService.DISAGREE_PWD){
			msg = "비밀번호가 일치하지 않습니다.";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../inc/message.jsp"></jsp:forward>
</body>
</html>