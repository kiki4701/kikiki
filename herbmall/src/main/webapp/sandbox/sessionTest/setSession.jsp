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
//Session => 사용자의 정보를 저장하는 방법 => 웹 서버에 저장됨
String id = "hong";
String pwd = "123";

session.setAttribute("id", id);	//name, value 쌍으로 넣는다
session.setAttribute("pwd", pwd);
%>

<h1>session에 정보가 저장됨!</h1>
<a href="useSession.jsp">세션 정보 읽어오기</a>
<hr>
<h2>session id : <%=session.getId() %></h2>


</body>
</html>