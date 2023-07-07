<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>언어를 선택하시면 좋은 책을 추천해드립니다</h3>
<form name="frm1" method="post"
	action="<%=request.getContextPath()%>/tips/book.do">
	<select name="lang">
		<option value="java">java</option>
		<option value="jsp">jsp</option>
		<option value="파이썬">파이썬</option>
		<option value="리액트">리액트</option>
	</select> <br>
	<br> <input type="submit" value="확인">
</form>
</body>
</html>