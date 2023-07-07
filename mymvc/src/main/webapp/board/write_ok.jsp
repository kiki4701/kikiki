<%@page import="java.sql.SQLException"%>
<%@page import="com.board.model.BoardVO"%>
<%@page import="com.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_ok.jsp</title>
</head>
<body>
	<%
	//write.jsp에서 등록 버튼을 누르면 post방식으로 서브밋 됨
    
    //1. 요청 파라미터 읽어오기    
    //요청 파라미터에 대한 인코딩처리
    request.setCharacterEncoding("utf-8");
   
    String title = request.getParameter("title");
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");
    String email = request.getParameter("email");
    String content = request.getParameter("content");
	
   	String ip=request.getRemoteAddr();
   	String ip2=request.getRemoteHost();
   	System.out.println("ip="+ip);
   	System.out.println("ip2="+ip2);
   	
    //2. db작업
    BoardDAO boardDao = new BoardDAO();
    BoardVO vo = new BoardVO();
    vo.setContent(content);
    vo.setEmail(email);
    vo.setName(name);
    vo.setPwd(pwd);
    vo.setTitle(title);
    
    try{
    	int cnt=boardDao.insertBoard(vo);
    	
	    //3. 결과처리
	    if(cnt>0){%>
	    	<script type="text/javascript">
	    		alert('글쓰기 처리되었습니다.');
	    		location.href="list.jsp";
	    	</script>
	    <%}else{%>
	    	<script type="text/javascript">
	    		alert('글쓰기 실패!');
	    		history.back();
	    	</script>	    	
	   <% }
    }catch(SQLException e){
    	e.printStackTrace();
    }
    
		
	%>
</body>
</html>

