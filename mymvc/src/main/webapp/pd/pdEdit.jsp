<%@page import="java.sql.SQLException"%>
<%@page import="com.pd.model.PdDTO"%>
<%@page import="com.pd.model.PdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdEdit.jsp</title>
</head>
<body>
<%
	//http://localhost:9090/mystudy/pd/pdEdit.jsp?no=5
	//pdDetail.jsp에서 [수정]링크 클릭하면 get방식으로 이동
	//1.요청 파라미터 읽어오기
	//String no = request.getParameter("no");

	//request에서 결과값 읽어오기
	//PdDTO dto = (PdDTO)request.getAttribute("dto");
%>

<h1>상품 수정</h1>
<form name="frmEdit" method="post" action="<c:url value='/pd/pdEdit_ok.do'/>">
	<input type="hidden" name="no" value="${param.no }">
	상품명 : <input type="text" name="pdName"
			value="${dto.pdName }"><br>
	가격 : <input type="text" name="price"
			value="${dto.price }"><br><br>
	<input type="submit" value="수정">
	<input type="reset" value="취소">
</form>
<br>
<a href="<c:url value='/pd/pdList.do'/>">상품 목록</a>
</body>
</html>