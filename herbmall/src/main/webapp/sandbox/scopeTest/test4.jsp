<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test4.jsp</title>
</head>
<body>
<h2>application scope 테스트</h2>
<form name="frm1" method="post" action="scope4.jsp">
	카운트 : <input type="text" name="count"><br>
	<input type="submit" value="전송">
</form>

<br><br>
세션 아이디 : <%=session.getId() %>

</body>
</html>