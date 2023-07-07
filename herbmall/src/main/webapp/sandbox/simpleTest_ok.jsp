<%@page import="com.herbmall.test.SimpleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>simpleTest_ok.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="sb" class="com.herbmall.test.SimpleVO" scope="page"></jsp:useBean>
<%-- <jsp:setProperty property="userid" name="sb"/>
<jsp:setProperty property="name" name="sb"/>
<jsp:setProperty property="no" name="sb"/> --%>

<jsp:setProperty property="*" name="sb"/>
<%
	//기존 방식
	/* String userid = request.getParameter("userid");
	String name = request.getParameter("name");
	String no = request.getParameter("no");
	
	SimpleVO vo = new SimpleVO();
	vo.setUserid(userid);
	vo.setName(name);
	vo.setNo(Integer.parseInt(no)); */
%>

<h1>기존방식</h1>
<%-- id : <%=vo.getUserid() %> <br>
name : <%=vo.getName() %> <br>
no : <%=vo.getNo() %> <br> --%>

<h1>getProperty이용</h1>
아이디는 <jsp:getProperty property="userid" name="sb"/><br>
이름은 <jsp:getProperty property="name" name="sb"/><br>
번호는 <jsp:getProperty property="no" name="sb"/><br>


</body>
</html>