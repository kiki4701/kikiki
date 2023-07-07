<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scope2.jsp</title>
</head>
<body>
<jsp:useBean id="countVO" class="com.herbmall.test.CounterVO" scope="request"></jsp:useBean>
<jsp:setProperty property="count" name="countVO"/>

<h2>scope2.jsp</h2>
count : <jsp:getProperty property="count" name="countVO"/>
<br>
<!-- <a href="result2.jsp">result2.jsp</a> -->
<jsp:forward page="result2.jsp"></jsp:forward>

</body>
</html>