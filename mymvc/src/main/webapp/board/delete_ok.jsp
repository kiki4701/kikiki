<%@page import="java.sql.SQLException"%>
<%@page import="com.board.model.BoardVO"%>
<%@page import="com.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete_ok.jsp</title>
</head>
<body>
<%
	//delete.jsp 에서 삭제 버튼 누를경우 post방식으로 이동
	//1. 파라미터 받기
	request.setCharacterEncoding("utf-8");

	String no = request.getParameter("no");
	String pwd = request.getParameter("pwd");
	
	  if(no==null || no.isEmpty()){%>
	   <script type="text/javascript">
	         alert("잘못된 url입니다.");
	         location.href = "list.jsp";
	      </script>
	   <% }
	  
	  /*if(pwd==null || no.isEmpty()){%>
		  <script type="text/javascript">
		  		alert("비밀번호를 확인해주세요.");
		  </script>
	  <%}else{%>
	  		<script type="text/javascript">
	  			confirm("정말 삭제 하시겠습니까?");
	  		</script>
	  		
	  <%}*/

	
	//2. db작업
	BoardDAO boardDAO = new BoardDAO();
	try{
		int cnt = boardDAO.deleteBoard(Integer.parseInt(no), pwd);
		
		if(cnt>0){%>
			<script type="text/javascript">
				alert('삭제 성공!');
				location.href='list.jsp';
			</script>
		<%}else{ %>
			<script type="text/javascript">
				alert('삭제 실패...');
				history.back();
			</script>
	
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}%>
</body>
</html>