<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result2.jsp</title>
</head>
<body>
<jsp:useBean id="countVO" class="com.herbmall.test.CounterVO" scope="request"></jsp:useBean>
<h2>result2.jsp</h2>
<hr>
count : <jsp:getProperty property="count" name="countVO"/>
<br>
<a href="scope2.jsp">scope2.jsp</a>

</body>
</html>