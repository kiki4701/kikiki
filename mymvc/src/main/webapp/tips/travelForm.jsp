<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>지역을 선택하시면 좋은 여행지를 추천해드립니다</h3>
<form name="frm1" method="post"
	action="<%=request.getContextPath()%>/tips/travel.do">
	<select name="city">
		<option value="강화">강화</option>
		<option value="강릉">강릉</option>
		<option value="해남">해남</option>
		<option value="거제">거제</option>
	</select> <br>
	<br> <input type="submit" value="확인">
</form>
</body>
</html>