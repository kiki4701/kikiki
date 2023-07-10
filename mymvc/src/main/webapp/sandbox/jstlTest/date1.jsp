<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>date1.jsp</title>
</head>
<body>
<%
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String str = sdf.format(d);
%>

<p>오늘 날짜는 <%=str %> 입니다.</p>
<p>파라미터 id : ${param.id }</p>

</body>
</html>