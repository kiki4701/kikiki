<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.reboard.model.ReBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>countUpdate.jsp</title>
</head>
<body>
<%
	//list.jsp에서 제목링크 클릭하면 get방식으로 이동
	
	//1
	String no=request.getParameter("no");
	if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert('잘못된 url!');
			location.href="list.jsp";
		</script>
		
	<%	return;
	}
	
	//2
	ReBoardDAO reBoardDao = new ReBoardDAO();
	
	try{
		int cnt=reBoardDao.updateReadCount(Integer.parseInt(no));
		
		//3
		if(cnt>0){
			response.sendRedirect("detail.jsp?no="+no);
		}else{ %>
			<script type="text/javascript">
				alert('조회수 증가 실패!');
				history.back();
			</script>	
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
%>
</body>
</html>








