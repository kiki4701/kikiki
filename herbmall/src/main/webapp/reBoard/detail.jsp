<%@page import="com.herbmall.reboard.model.ReBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.reboard.model.ReBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>답변형게시판 상세보기 - 허브몰</title>
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm {
		width: 500px;
		}
</style>  
</head>
<body>
	<%
		//http://localhost:9090/herbmall/reBoard/detail.jsp?no=2
		//countUpdate.jsp에서 조회수증가 성공하면 get방식으로 이동
		
		//1
		String no=request.getParameter("no");
		if(no==null || no.isEmpty()){%>
			<script type="text/javascript">
				alert('잘못된 url입니다.');
				location.href="list.jsp";
			</script>
			
		<%	return;
		}
		
		//2
		ReBoardDAO reBoardDao = new ReBoardDAO();
		ReBoardVO vo=null;
		try{
			vo=reBoardDao.selectByNo(Integer.parseInt(no));	
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		//3
		String content = vo.getContent();
		if(content!=null){  // \r\n  => <br>
			content=content.replace("\r\n","<br>");
		}else{
			content="";
		}
		
	%>
	
	<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span><%=vo.getTitle() %></span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span><%=vo.getName() %></span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span><%=vo.getRegdate() %></span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span><%=vo.getReadcount() %></span>
		</div>
		<div class="lastDiv">			
			<p class="content"><%=content %></p>
		</div>
		<div class="center">
			<a href='write.jsp?no=<%=no%>'>수정</a> |
        	<a href='delete.jsp?no=<%=no%>&step=<%=vo.getStep()%>&groupNo=<%=vo.getGroupNo()%>'>삭제</a> |
        	<a href='reply.jsp?no=<%=no%>'>답변</a> |        	
        	<a href='list.jsp'>목록</a>			
		</div>
	</div>

	
</body>
</html>