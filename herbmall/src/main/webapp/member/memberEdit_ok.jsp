<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/loginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberEdit_ok</title>
</head>
<jsp:useBean id="memService" class="com.herbmall.member.model.MemberService" scope="session"></jsp:useBean>
<body>
<%
	//1 memberEdit 에서 수정 버튼 눌렀을 때 post 방식으로 이동
	request.setCharacterEncoding("utf-8");
	String userid = (String)session.getAttribute("userid");
	
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String addressdetail = request.getParameter("addressDetail");
	String pwd = request.getParameter("pwd");
	String hp1=request.getParameter("hp1");
	String hp2=request.getParameter("hp2");
	String hp3=request.getParameter("hp3");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email3 = request.getParameter("email3");

	String hp="";
	String email="";
	
	if(hp2!=null&& !hp2.isEmpty() && hp3!=null && !hp3.isEmpty()){
		hp = hp1 + "-" + hp2 + "-" + hp3;
	}
	
	if(email1!=null && !email1.isEmpty()){
	      if(email2.equals("etc")){
	         if(email3!=null && !email3.isEmpty()){
	            email=email1+"@"+email3;
	         }
	      }else{
	         email=email1+"@"+email2;
	      }
	   }
	
	   MemberVO memVo = new MemberVO();
	   memVo.setUserid(userid);
	   memVo.setZipcode(zipcode);
	   memVo.setAddress(address);
	   memVo.setAddressDetail(addressdetail);
	   memVo.setEmail(email);
	   memVo.setHp(hp);

	   String msg="수정 실패",url="memberEdit.jsp";
	   try{
		   int result=memService.checkLogin(userid, pwd);
		   
		   if(result==memService.LOGIN_OK){
		      int cnt=memService.updateMember(memVo);
		      
		      if(cnt>0){
		         msg="회원정보가 수정되었습니다.";
		      }
		   }else if(result==memService.DISAGREE_PWD){
		      msg="비밀번호가 틀렸습니다.";
		   }
	   }catch(SQLException e){
		   e.printStackTrace();
	   }
	   
	   request.setAttribute("msg", msg);
	   request.setAttribute("url", url);
	
%>
<jsp:forward page="../inc/message.jsp"></jsp:forward>

</body>
</html>