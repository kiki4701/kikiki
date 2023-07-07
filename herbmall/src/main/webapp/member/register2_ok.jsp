<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register2_ok.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memDao" class="com.herbmall.member.model.MemberDAO" scope="session"></jsp:useBean>
<jsp:useBean id="memVo" class="com.herbmall.member.model.MemberVO" scope="page"></jsp:useBean>

<jsp:setProperty property="*" name="memVo"/>

<%
	//1
	
	//2
	String msg="회원가입 실패!", url="register2.jsp";
	try{
		int cnt = memDao.insertMember(memVo);
		//3
		if(cnt>0){
			msg="회원가입되었습니다.";
			url="../index.jsp";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../inc/message.jsp"></jsp:forward>
</body>
</html>