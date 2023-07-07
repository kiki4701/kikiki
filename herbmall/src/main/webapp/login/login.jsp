<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%
	//쿠키 읽어오기
	String ck_value="";
	Cookie[] ckArr = request.getCookies();
	if(ckArr!=null){
		for(int i = 0; i < ckArr.length; i++){
			String ck_name=ckArr[i].getName();
			if(ck_name.equals("ck_userid")){
				ck_value=ckArr[i].getValue();
				break;
			}
		}//for
	}
%>
<article class="simpleForm">
   <form name="frmLogin" method="post"   action="login_ok.jsp">
      <fieldset>
         <legend>로그인</legend>
         <div>
            <label for="userid" class="label">아이디</label>
            <input type="text" name="userid" id="userid" value="<%=ck_value%>">
         </div>
         <div>
            <label for="pwd" class="label">비밀번호</label>
            <input type="password" name="pwd" id="pwd">
         </div>
         <div class="align_center">
            <input type="submit" id="lg_submit" value="로그인">
            <input type="checkbox" name="chkSave" id="chkSave"
				<%if(ck_value!=null && !ck_value.isEmpty()){%>
					checked="checked"
				<%}%>            
            
            >
            <label for="chkSave">아이디 저장하기</label>
         </div>
      </fieldset>
   </form>
</article>
<%@ include file="../inc/bottom.jsp"%>