<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
	//String no = request.getParameter("no");

	//BookDTO dto = (BookDTO)request.getAttribute("dto");
%>
<meta charset="UTF-8">
<title>bookDetail.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#aDel').click(function(){
			if(confirm("삭제하시겠습니까?")){
				<%-- location.href="<%=request.getContextPath()%>/book/bookDelete.do?no=${dto.no}"; --%>
				location.href="<c:url value='/book/bookDelete.do?no=${dto.no}'/>";
			}
		});
	});
</script>
</head>
<body>
	<h1>상품 상세보기</h1>
	<p>${dto.no }을 클릭하셨습니다
	</p>
	<p>
		번호 :
		${dto.no }</p>
	<p>
		책 제목 :
		${dto.title }</p>
	<p>
		가격 :
		${dto.price }원
	</p>
	<p>
		등록일 :
		${dto.joindate }</p>

	<a href="<c:url value='/book/bookList.do'/>">목록</a>
	<a href="bookEdit.jsp">수정</a>
	<a href="#" id="aDel">삭제</a>
</body>
</html>