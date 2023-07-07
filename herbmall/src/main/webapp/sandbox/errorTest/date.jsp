<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorTest.jsp" %>
<!-- 에러가 발생되면 에러를 처리하면 페이지인 errorTest.jsp에서 처리함 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>date.jsp</title>
</head>
<body>
<%
	Date d = new Date();
 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 	String str = sdf.format(d);
%>

<h1>보통의 jsp 페이지</h1>
<%-- <p>오늘 날짜는 <%=st %></p> --%>
<!-- 고의로 에러가 발생하도록 선언되지 않은 변수 사용 -->

</body>
</html>	