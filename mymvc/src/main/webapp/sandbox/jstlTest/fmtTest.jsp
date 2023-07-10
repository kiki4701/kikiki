<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmtTest.jsp</title>
</head>
<body>
<h1>formatNumber</h1>
<c:set var="num" value="12345.678"/>
<h2>num => ${num }</h2>
<p>number : <fmt:formatNumber value="${num }" type="number"/></p>
<p>currency : <fmt:formatNumber value="${num }" type="currency" currencySymbol="$"/></p>
<p>percent : <fmt:formatNumber value="${num }" type="percent"/></p>
<p>pattern .0 => <fmt:formatNumber value="${num }" pattern=".0"/></p>
<p>pattern #,### => <fmt:formatNumber value="${num }" pattern="#,###"/></p>

<h1>formatDate</h1>
<c:set var="today" value="<%=new Date() %>"></c:set>
<h2>today => ${today }</h2>
<p>date : <fmt:formatDate value="${today }" type="date"/></p>
<p>time : <fmt:formatDate value="${today }" type="time"/></p>
<p>both : <fmt:formatDate value="${today }" type="both"/></p>
<p>pattern : <fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
<p>dateStyle-long : <fmt:formatDate value="${today }" type="both"
	dateStyle="long"/></p>
<p>dateStyle-default : <fmt:formatDate value="${today }" type="both"
	dateStyle="default"/></p>
<p>dateStyle-short : <fmt:formatDate value="${today }" type="both"
	dateStyle="short"/></p>
<p>dateStyle-medium : <fmt:formatDate value="${today }" type="both"
	dateStyle="medium"/></p>
<p>dateStyle-full : <fmt:formatDate value="${today }" type="both"
	dateStyle="full"/></p>

</body>
</html>