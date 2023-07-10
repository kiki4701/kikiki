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
<h1>jstl - foreach<</h1>
<h2>1~100 까지의 짝수의 합 구하기</h2>
<p>짝수 출력</p>
<c:set var="sum" value="0"></c:set>

<c:forEach var="i" begin="1" end="100">
	<c:if test="${i%2 == 0 }">
		${i } &nbsp;&nbsp;
		
		<c:set var="sum" value="${sum + i }"></c:set>
	</c:if>
</c:forEach>

<hr>
<p>짝수의 합 : ${sum }</p>

<h2>header 파라미터명, 값 출력</h2>
<c:forEach var="head" items="${headerValues }">
	header 키 : ${head.key }<br>
	header 값 : 
	<c:forEach var="val" items="${head.value }">
		${val }
	</c:forEach>
	<br><br>
</c:forEach>

</body>
</html>