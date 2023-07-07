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
	request.setCharacterEncoding("utf-8");
	String url="date.jsp";
%>
<h1>includeTest.jsp 페이지입니다</h1>
<hr>
<!-- include 액션 태그 이용하여 date.jsp 포함시키기 -->
<jsp:include page="date.jsp" />
<hr>

<h2>include액션 태그 -표현식 이용</h2>
<jsp:include page="<%=url %>"></jsp:include>
<hr>

<h2>include액션 태그 - param 이용</h2>
<jsp:include page="date.jsp">
	<jsp:param value="3" name="no"/>
	<jsp:param value="홍길동" name="name"/>
</jsp:include>

</body>
</html>