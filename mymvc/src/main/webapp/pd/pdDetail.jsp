<%@page import="java.text.DecimalFormat"%>
<%@page import="com.pd.model.PdDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.pd.model.PdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

</head>
<body>

<%
	//http://localhost:9090/mystudy/pd/pdDetail.jsp?no=4
	//pdList.jsp에서 [제목]클릭하면 get방식으로 이동
	
	//뷰 페이지
	//결과 받아와서 화면 처리하기
	//String no = request.getParameter("no");	//view 페이지에서도 request를 공유하므로 파라미터를 
	//읽어올 수 있다 (원래 컨트롤러 페이지랑 다 한몸이었으니까 컨트롤러에서 되던거 여기서도 된다고 생각하면된다.)
	//그냥 dto.getNo(); 으로 처리해도 되는데 여기서도 getparameter가 된다는걸 보기위해 사용해봄
	//PdDTO dto = (PdDTO)request.getAttribute("dto");
	
	//DecimalFormat df = new DecimalFormat("#,###");
%>

<meta charset="UTF-8">
<title>pdDetail.jsp</title>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#aDel').click(function() {
			//alert("삭제 하시겠습니까?");
			if(confirm("삭제하시겠습니까?")){
				location.href="<c:url value='/pd/pdDelete.do?no=${param.no}'/>";
			}
		});
	});

</script>
	
	<h1>상품 상세보기</h1>
	<p>상품번호 : ${param.no }</p>
	<p>상품명 : ${dto.pdName }</p>
	<p>가격 : <fmt:formatNumber value="${dto.price }" pattern="#,###"/> 원</p>
	<p>등록일 : ${dto.regdate }</p>
	
	<a href="<c:url value='/pd/pdList.do'/>">목록</a> 
	| <a href="<c:url value='/pd/pdEdit.do?no=${param.no}'/>">수정</a>
	| <a href="#" id="aDel">삭제</a>
</body>
</html>










