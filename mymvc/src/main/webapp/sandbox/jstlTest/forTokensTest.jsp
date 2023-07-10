<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jstl - forTokens</h1>
<c:forTokens var="fruit" items="apple, banana, grape, pear, kiwi" delims=",">
	과일 이름: <c:out value="${fruit}"/><br>
</c:forTokens>


</body>
</html>