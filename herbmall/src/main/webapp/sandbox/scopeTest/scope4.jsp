<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scope4.jsp</title>
</head>
<body>
<jsp:useBean id="countVO" class="com.herbmall.test.CounterVO" scope="application"></jsp:useBean>
<jsp:setProperty property="count" name="countVO"/>

<h2>scope4.jsp</h2>
count : <jsp:getProperty property="count" name="countVO"/>
<br>
<a href="result4.jsp">result4.jsp</a>

<br><br>
세션 아이디 : <%=session.getId() %>

</body>
</html>