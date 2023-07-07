<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tips/messageView.jsp</title>
</head>
<body>
<%
	String result = (String)request.getAttribute("result");
%>
<h1>뷰페이지</h1>
<p>결과값 : <%=result %></p>
</body>
</html>