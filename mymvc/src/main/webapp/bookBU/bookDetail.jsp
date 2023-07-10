<%@page import="com.book.model.BookService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.book.model.BookDTO"%>
<%@page import="com.book.model.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String no = request.getParameter("no");

	BookDTO dto = (BookDTO)request.getAttribute("dto");
%>
<meta charset="UTF-8">
<title>bookDetail.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#aDel').click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="<%=request.getContextPath()%>/book/bookDelete.do?no=<%=no%>";
			}
		});
	});
</script>
</head>
<body>
	<h1>상품 상세보기</h1>
	<p><%=no%>을 클릭하셨습니다
	</p>
	<p>
		번호 :
		<%=dto.getNo()%></p>
	<p>
		책 제목 :
		<%=dto.getTitle()%></p>
	<p>
		가격 :
		<%=dto.getPrice()%>원
	</p>
	<p>
		등록일 :
		<%=dto.getJoindate()%></p>

	<a href="<%=request.getContextPath()%>/book/bookList.do">목록</a>
	<a href="bookEdit.jsp">수정</a>
	<a href="#" id="aDel">삭제</a>
</body>
</html>