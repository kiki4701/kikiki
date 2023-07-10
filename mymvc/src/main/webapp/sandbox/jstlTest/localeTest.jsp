<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="en"/> <!-- 기본이 한글로 되어있는데 en으로 바꾸면 영어로 나옴 -->
<fmt:bundle basename="bundle.testBundle">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>localeTest.jsp</title>
</head>
<body>
<h1>다국어 페이지 연습</h1>
<fmt:message key="name"></fmt:message>
<br>
<fmt:message key="message" var="msg"></fmt:message>
<c:out value="${msg }"></c:out>

</body>
</html>

</fmt:bundle>