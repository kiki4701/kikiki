<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% //date2.jsp
	String no= request.getParameter("no");
	String name=request.getParameter("name");
	Date date = new Date();
	String str=date.toLocaleString();
%>
<p>파라미터 no : <%=no %></p>
<p>파라미터 name : <%=name %></p>

<p>현재일자는 <%=str %>입니다.</p>
</body>
</html>