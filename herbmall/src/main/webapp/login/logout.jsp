<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>
<%
	session.invalidate(); //세션에 있는거 다 날리는 메서드
	response.sendRedirect("../index.jsp");
%>
</body>
</html>