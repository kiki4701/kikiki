<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginCheck.jsp</title>
</head>
<body>
<%
	//로그인이 되지 않은 경우 에러 처리
	String l_userid = (String)session.getAttribute("userid");
	String ctxPath = request.getContextPath();	//=> /herbmall
		
	//로그인 안된 경우
	if(l_userid==null || l_userid.isEmpty()){%>
		<script type="text/javascript">
			alert("먼저 로그인하세요");
			location.href="<%=ctxPath%>/login/login.jsp";
		</script>
		
	<%	return;
	}
%>

</body>
</html>