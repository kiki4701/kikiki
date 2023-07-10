<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fnTest.jsp</title>
</head>
<body>
<h1>jstl - fn</h1>
<p>abcd => Abcd로 바꾸기</p>
<c:set var="str" value="abcd"/>
str변수의 값 : ${str }<br>
replace함수 사용 후 : ${fn:replace(str, "a", "A") }<br>

<h2>str변수에서 b의 위치 구하기</h2>
${fn:indexOf(str, "b") }<br>

<h2>birth 변수에서 월만 추출</h2>
<c:set var="birth" value="1999-07-10"/>
${fn:substring(birth, 5, 7) }<br>

<h2>split() 함수 이용</h2>
<c:set var="result1" value="${fn:split(birth, '-') }"></c:set>
${result1[0] } 년 ${result1[1] }월 ${result1[2] }일 <br>

<h2>함수의 결과를 변수에 넣기</h2>
<c:set var="result" value="${fn:replace(str, 'a', 'A') }"></c:set>
${result }
</body>
</html>