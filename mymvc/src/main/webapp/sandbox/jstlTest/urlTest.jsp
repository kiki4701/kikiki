<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainstyle.css'/>">
</head>
<body>
<h1>jstl - url</h1>
<a href="<c:url value='/sandbox/elTest/elTest1.jsp'/>">elTest1 으로 이동</a>
<br>
<br>
<img src="<c:url value='/images/herb.JPG'/>">
<hr>
<p>context path : ${pageContext.request.contextPath }</p>
<img src="${pageContext.request.contextPath }/images/herb.JPG">

</body>
</html>