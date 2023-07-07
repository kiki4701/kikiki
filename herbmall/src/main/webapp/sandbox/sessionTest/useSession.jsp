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
	//세션 정보 읽어오기
	String id = (String)session.getAttribute("id");
	String pwd = (String)session.getAttribute("pwd");
	
	int interval = session.getMaxInactiveInterval();	//기본 - 30분 (1800초)
%>

<h1>세션 정보</h1>
<p>아이디 : <%=id %></p>
<p>비밀번호 : <%=pwd %></p>
<hr>
<h2>세션 유지 시간 : <%=interval %>초</h2>
<h3>session id : <%=session.getId() %></h3>
<br>
<a href="logout.jsp">로그아웃</a>

</body>
</html>