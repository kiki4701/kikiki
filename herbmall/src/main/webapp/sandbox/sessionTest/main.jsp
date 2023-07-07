<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>main 페이지</h1>
<%
	String id = (String)session.getAttribute("id");
%>
<h2>session id : <%=session.getId() %></h2>
<h3>세션 정보 - id : <%=id %></h3>
<a href="setSession.jsp">setSession.jsp로 이동</a>

</body>
</html>