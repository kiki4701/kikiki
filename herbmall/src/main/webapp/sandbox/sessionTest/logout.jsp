<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//로그아웃
	//세션의 모든 정보 삭제
	session.invalidate();

	response.sendRedirect("main.jsp");
%>

</body>
</html>