<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scope1.jsp</title>
</head>
<body>
<jsp:useBean id="countVO" class="com.herbmall.test.CounterVO" scope="page"></jsp:useBean>
<jsp:setProperty property="count" name="countVO"/>

<h2>scope1.jsp</h2>
count : <jsp:getProperty property="count" name="countVO"/>
<br>
<a href="result1.jsp">result1.jsp</a>

</body>
</html>