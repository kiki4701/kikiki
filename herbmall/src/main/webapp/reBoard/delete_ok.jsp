<%@page import="com.herbmall.reboard.model.ReBoardVO"%>
<%@page import="java.sql.SQLException"%>
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
   
   String step=request.getParameter("step");
   String groupNo=request.getParameter("groupNo");
   
   ReBoardDAO reBoardDAO = new ReBoardDAO();
   
   ReBoardVO vo =new ReBoardVO();
   vo.setNo(Integer.parseInt(no));
   vo.setStep(Integer.parseInt(step));
   vo.setGroupNo(Integer.parseInt(groupNo));

   try{
	   if(reBoardDAO.checkPwd(Integer.parseInt(no), pwd)){
       	    reBoardDAO.deleteReBoard(vo);
       %>       	    
            <script type="text/javascript">
               alert('삭제 성공!');
               location.href='list.jsp';
            </script>
   <% }else{%>
           <script type="text/javascript">
              alert("비밀번호가 틀렸습니다.");
              history.back();
           </script>
 <%   }
   }catch(SQLException e){
      e.printStackTrace();
   }%>

</body>
</html>