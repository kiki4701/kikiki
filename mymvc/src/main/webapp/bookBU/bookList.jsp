<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="com.book.model.BookDTO"%>
<%@page import="com.book.model.BookDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	List<BookDTO> list = (List<BookDTO>)request.getAttribute("list");
	
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
	DecimalFormat df = new DecimalFormat("#,###");
	%>
	<table border = "1">
		<tr>
			<th>번호</th><th>제목</th><th>가격</th><th>출판사</th><th>등록일자</th>
		</tr>
		<%
		if(list==null || list.isEmpty()){ %>
		<tr>
			<td colspan="5">데이터가 없습니다.</td>
		</tr><% 
		}else{
			for(int i = 0; i < list.size(); i++){
				BookDTO dto = list.get(i);%>
			<tr>
				<td><%=dto.getNo() %></td>
				<td><a href="<%=request.getContextPath() %>/book/bookDetail.do?no=<%=dto.getNo() %>"><%=dto.getTitle() %></a></td>
				<td><%=df.format(dto.getPrice()) %></td>
				<td><%=dto.getPublisher() %></td>
				<td><%=sdf.format(dto.getJoindate()) %></td>
			</tr>
			<%
			}
		}
		%>
	</table>
	<a href = "<%=request.getContextPath() %>/book/bookWrite.do"><input type = "button" value = "책등록"></a>
	 
	
</body>
</html>