<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.reboard.model.ReBoardVO"%>
<%@page import="com.herbmall.reboard.model.ReBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply_ok.jsp</title>
</head>
<body>

<%
	//reply.jsp에서 [답변]을 클릭하면 post방식으로 submit됨
	//1. 요청 파라미터 읽어오기
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
	//답변형
	String groupNo = request.getParameter("groupNo");
	String step = request.getParameter("step");
	String sortNo = request.getParameter("sortNo");
	
	//2
	ReBoardDAO dao = new ReBoardDAO();
	ReBoardVO vo = new ReBoardVO();
	
	vo.setTitle(title);
	vo.setName(name);
	vo.setPwd(pwd);
	vo.setEmail(email);
	vo.setContent(content);
	
	vo.setGroupNo(Integer.parseInt(groupNo));
	vo.setStep(Integer.parseInt(step));
	vo.setSortNo(Integer.parseInt(sortNo));
	
	try{
	   int cnt = dao.reply(vo);
	   
	   if(cnt>0){%>
	      <script type="text/javascript">
	         alert("답변 등록 완료");
	         location.href = "list.jsp"
	      </script>
	   <%}else{%>
	      <script type="text/javascript">
	         alert("답변 등록 실패!");
	         history.back();
	      </script>
	   <%}
	}catch(SQLException e){
	   e.printStackTrace();
	}
	%>
</body>
</html>