<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookWrite</title>
<script type="text/javascript" src = "../js/jquery-3.7.0.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<h1>책 등록</h1>
	<form name="formWrite" action="<%=request.getContextPath() %>/book/bookWrite_ok.do" method="post">
		책제목 : <input type="text" name="title"><br>
		가격 : 	<input type="text" name="price"><br> 
		퍼블리셔 : <input type="text" name="publisher"><br>
		  		<input type="submit" value="등록">
		  		<input type="reset" value="취소">
	</form>
	<hr>
	<a href="<%=request.getContextPath() %>/book/bookList.do">책 목록</a>
</body>
</html>