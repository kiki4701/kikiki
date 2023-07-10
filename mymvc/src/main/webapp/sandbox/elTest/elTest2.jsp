<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<H3>표현언어 -파라미터값 처리</H3><P>
<%
	request.setCharacterEncoding("utf-8");
%>

<FORM action="elTest2.jsp" method="post">
	이름 : <input type="text" name="name" value="${param['name'] }">
		<input type="submit" value="확인">
</FORM>

<h1>파라미터 값</h1>
<p>표현언어 이용, 이름 : ${param.name }</p>
<p>기존방식, 이름 : <%=request.getParameter("name") %></p>

</body>
</html>