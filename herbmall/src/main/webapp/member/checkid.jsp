<%@page import="com.herbmall.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="memService" class="com.herbmall.member.model.MemberService" scope="session"></jsp:useBean>
<%
	//http://localhost:9090/herbmall/member/checkid.jsp?userid=kiki
	//register.jsp 에서 중복확인 눌렀을때 open()에 의해 새창 열림, get방식으로 이동
	//1 파라미터 읽어오기
	String userid=request.getParameter("userid");
	
	//2
	//아이디를 입력한 경우에만 db작업
	int result = 0;
	if(userid != null && !userid.isEmpty()){
		try{
			result = memService.duplicateID(userid);
		}catch(SQLException e){
			e.printStackTrace();	
		}
	}//if
	
	//3
	
	
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mainstyle.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>

<script type="text/javascript">
	$(function () {
		$('#btUse').click(function () {
			$(opener.document).find('#userid').val("<%=userid%>");
			$(opener.document).find("#chkId").val("Y");
			
			self.close();
		});
		
		$('form[name=frmId]').submit(function () {
			if($('#userid').val().length<1){
				$('.errorMessage').show();
				event.preventDefault();
			}
		})
		
	});
</script>
</head>
<body>
<h1>아이디 중복 검사</h1><br>
<form name="frmId" method="post" action="checkid.jsp">
	<input type="text" id="userid" name="userid" value="<%=userid %>" title="아이디입력">
	<input type="submit" id="submit" value="아이디 확인">
	<span class="errorMessage" style="display: none">아이디를 입력하세요</span>
	
	<%if(result==MemberService.UNUSABLE_ID){	//이미존재 - 사용불가 %>
		<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
	<%}else if(result==MemberService.USABLE_ID){	//사용가능 %>
		<input type="button" value="사용하기" id="btUse">
		<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
	<%} %>
</form>

</body>
</html>