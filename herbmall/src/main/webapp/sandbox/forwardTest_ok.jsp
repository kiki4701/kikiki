<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardTest_ok.jsp</title>
</head>
<body>
<% 
	//forwardTest_ok.jsp
	request.setCharacterEncoding("utf-8");

	request.setAttribute("lang", "자바");
	
	//a.jsp로 포워드하기
%>

<h1>forwardTest_ok.jsp페이지</h1>
<jsp:forward page="a.jsp">
	<jsp:param value="축구" name="hobby"/>
</jsp:forward>
<!-- forwardTest_ok.jsp 와 a.jsp는 request를 공유함 -->

</body>
</html>