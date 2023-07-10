<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="com.book.model.BookDTO"%>
<%@page import="com.book.model.BookDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookList.jsp</title>
<script type="text/javascript">
	function write(){
		location.href = "bookWrite.jsp";
	}
</script>
</head>
<body>
	<%
	//List<BookDTO> list = (List<BookDTO>)request.getAttribute("list");
	
	//SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
	//DecimalFormat df = new DecimalFormat("#,###");
	%>
	<table border = "1">
		<tr>
			<th>번호</th><th>제목</th><th>가격</th><th>출판사</th><th>등록일자</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="5">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
			<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.no }</td>
					<td><a href="<c:url value='/book/bookDetail.do?no=${dto.no }'/>">${dto.title }</a></td>
					<td><fmt:formatNumber value="${dto.price }" pattern="#,###"/></td>
					<td>${dto.publisher }</td>
					<td><fmt:formatDate value="${dto.joindate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
			</c:forEach>	
		</c:if>
	</table>
	<a href = "<c:url value='/book/bookWrite.do'/>"><input type = "button" value = "책등록"></a>
	 
	
</body>
</html>