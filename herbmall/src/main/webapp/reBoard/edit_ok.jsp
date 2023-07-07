<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.reboard.model.ReBoardVO"%>
<%@page import="com.herbmall.reboard.model.ReBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//write.jsp에서 [수정]버튼을 클릭하면 post방식으로 submit됨
	
	//1
	request.setCharacterEncoding("utf-8");
   
	String no = request.getParameter("no");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
	
	//2
	ReBoardDAO reBoardDao = new ReBoardDAO();
	ReBoardVO vo = new ReBoardVO();
	
	vo.setNo(Integer.parseInt(no));
	vo.setTitle(title);
	vo.setName(name);
	vo.setPwd(pwd);
	vo.setEmail(email);
	vo.setContent(content);
	
	try {
		if(reBoardDao.checkPwd(Integer.parseInt(no), pwd)){ //비밀번호가 일치하면 수정처리
		   	int cnt = reBoardDao.updateReBoard(vo);
		
			//3
			if(cnt>0){ %>
				<script type="text/javascript">
					alert("글 수정되었습니다.");
					location.href="detail.jsp?no=<%=no%>";
				</script>	
		<%	}else{%>
				<script type="text/javascript">
					alert("글 수정 실패!");
					history.go(-1);
				</script>				
		<%	}
		}else{ //비밀번호 불일치 %>
			<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다.");
				history.go(-1);
			</script>	
	<%  }
	} catch (SQLException e) {
	   	e.printStackTrace();
	}
	
%>
</body>
</html>



