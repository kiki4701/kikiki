<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.pd.model.PdDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.pd.model.PdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdList.jsp</title>
</head>
<body>
<%
	//[1] pdWrite.jsp에서 상품목록 링크 클릭하면 get방식으로 이동
	//[2] pdWrite_ok.jsp에서 상품등록 성공하면 get방식으로 이동
			
	//뷰페이지
	//reqeust에서 결과를 받아와서 화면 처리
	
	List<PdDTO> list = (List<PdDTO>)request.getAttribute("list");
	
	//3. 결과 처리
	DecimalFormat df = new DecimalFormat("#,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<h1>상품 목록</h1>
<table border="1" style="width: 500px">
	<tr>
		<th>번호</th>
		<th>상품명</th>
		<th>가격</th>
		<th>등록일</th>
	</tr>
	<%
		if(list==null || list.isEmpty()){%>
			<tr>
				<td colspan="4">데이터가 없습니다.</td>
			</tr>
	<%	}else{%>
		<!-- 반복시작 -->
		<%for(int i=0;i<list.size();i++){ 
			PdDTO dto=list.get(i);
		%>
			<tr>
				<td><%=dto.getNo() %></td>
				<td>
					<a href="<%=request.getContextPath() %>/pd/pdDetail.do?no=<%=dto.getNo() %>">
						<%=dto.getPdName() %>
					</a>
				</td>
				<td style="text-align: right;"><%=df.format(dto.getPrice()) %>원</td>
				<td><%=sdf.format(dto.getRegdate()) %></td>
			</tr>
		<%}//for %>
		<!-- 반복끝 -->
	<%}//if %>
</table>
<br><br>
<a href="<%=request.getContextPath() %>/pd/pdWrite.do">상품 등록</a>

</body>
</html>












