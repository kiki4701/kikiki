<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result4.jsp</title>
</head>
<body>
<jsp:useBean id="countVO" class="com.herbmall.test.CounterVO" scope="application"></jsp:useBean>
<h2>result4.jsp</h2>
<hr>
count : <jsp:getProperty property="count" name="countVO"/>
<br>
<a href="scope4.jsp">scope4.jsp</a>

<br><br>
세션 아이디 : <%=session.getId() %>

</body>
</html>