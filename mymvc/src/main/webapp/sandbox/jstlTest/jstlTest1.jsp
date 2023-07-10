<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlTest1.jsp</title>
</head>
<body>
<h1>jstl core - set, out, remove</h1>
<c:set var="browser" value="${header['user-agent'] }"></c:set>

<h2>el 표현식 이용	</h2>
<p>브라우저 정보 : ${browser }</p>

<h2>jstl 이용</h2>
<p>브라우저 정보 : <c:out value="${browser }"></c:out></p>

<h2>browser 변수 제거 후</h2>
<c:remove var="browser"/>
<p>브라우저 정보 : <c:out value="${browser }"></c:out>
</p>
</body>
</html>