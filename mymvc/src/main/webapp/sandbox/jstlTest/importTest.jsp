<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>importTest.jsp</title>
</head>
<body>
<c:import url="date1.jsp" var="today"></c:import>
<h1>jstl - import</h1>
${today }
<hr>
<h2>date1.jsp 한번 더 import</h2>
<c:import url="date1.jsp">
	<c:param name="id" value="hong"></c:param>
</c:import>

</body>
</html>