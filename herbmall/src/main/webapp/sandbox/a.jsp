<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a.jsp</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String hobby = request.getParameter("hobby");
	
	String lang = (String)request.getAttribute("lang");
%>
<h1>a.jsp페이지입니다</h1>
<p>파라미터 name : <%=name %></p>
<p>파라미터 address : <%=address %></p>
<p>파라미터 hobby : <%=hobby %></p>

<p>address 속성 : <%=lang %></p>

</body>
</html>