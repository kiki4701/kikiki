<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jstl core - if, choose ~ when ~ otherwise</h1>
<c:set var="country" value="korea"></c:set>

<h2>if 이용</h2>
<c:if test="${!empty country }">
	${country } 에서 살아요
</c:if>
<c:if test="${empty country }">
	변수에 값이 없습니다.
</c:if>

<h2>choose 이용</h2>
<c:choose>
	<c:when test="${country == 'korea' }">
		${country } (한국)에서 살아요
	</c:when>
	<c:when test="${country == 'canada' }">
		${country } (캐나다)에서 살아요
	</c:when>
	<c:otherwise>
		그 외의 나라에서 살아요
	</c:otherwise>
</c:choose>


</body>
</html>