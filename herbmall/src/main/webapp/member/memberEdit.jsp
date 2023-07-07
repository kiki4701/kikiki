<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.member.model.MemberVO"%>
<%@page import="com.herbmall.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/loginCheck.jsp" %>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
	$(function () {
		$('#wr_submit').click(function () {
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력해주세요');
				$('#pwd').focus();
				event.preventDefault();
				return;
			}
			if($('#pwd2').val().length<1){
				alert('비밀번호를 입력해주세요');
				$('#pwd2').focus();
				event.preventDefault();
				return;
			}
			if(!($('#pwd').val()===$('#pwd2').val())){
				alert('비밀번호가 일치하지 않습니다');
				event.preventDefault();
				return;
			}
			
			var hp2 = $('#hp2').val();
			var hp3 = $('#hp3').val();
			if(!validate_hp(hp2) || !validate_hp(hp3)){
				alert('핸드폰 번호는 숫자만 입력 가능합니다.');
				event.preventDefault();
				return;
			}
			
			var userid = $('#userid').val();
			if(!validate_userid(userid)){
				alert('아이디가 유효하지않습니다');
				event.preventDefault();
				return;
			}
			
		})
	})
	
	function validate_hp(ph) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(ph); //정규식과 일치하면 true
		/* 정규식 /^[0-9]*$/g
		0 에서 9 사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
		닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복		*/
	}
	
</script>

<style type="text/css">
	.width_80{
		width:80px;
	}
	.width_350{
		width:350px;
	}	
</style>
<jsp:useBean id="memService" class="com.herbmall.member.model.MemberService" scope="session"></jsp:useBean>
<%	
	//1	세션에서 id 가져오기(로그인 하고나면 무조건 세션에서 가져오기)
	//	(받아오는 파라미터는 없지만 정보 수정에서 이름이랑 id 뿌려놓으려면 db에서 id로 검색해야 하므로 id필요)
	String userid = (String)session.getAttribute("userid");
	
	//2
	MemberVO vo = null;
	try{
		vo = memService.selectMember(userid);
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	String zipcode = vo.getZipcode();
    String address = vo.getAddress();
    String addressDetail = vo.getAddressDetail();
   
    if(zipcode==null) zipcode = "";
    if(address==null) address = "";
    if(addressDetail==null) addressDetail = "";
    
    //010-100-2000, ""
    String hp = vo.getHp();
    String hp1 ="";
    String hp2 ="";
    String hp3 ="";
    if(hp!= null && !hp.isEmpty()){
	    String[] hpArr = vo.getHp().split("-");
	    hp1 = hpArr[0];
	    hp2 = hpArr[1];
	    hp3 = hpArr[2];
    }
    
    
    
    //hh@naver.com, aa@herb.com, ""
    boolean isEtc = false;
    String email = vo.getEmail();
    String email1 = "";
    String email2 = "";
    String[] emailList={"naver.com", "hamail.net", "nate.com", "gamil.com"};
    if(vo.getEmail()!= null && !vo.getEmail().isEmpty()){
	    String[] emailArr = vo.getEmail().split("@");
	    email1 = emailArr[0]; //hh, aa
	    email2 = emailArr[1]; //nate.com, herb.com
    
	    int count = 0;
	    for(int i = 0; i < emailList.length; i++){
	    	if(email2.equals(emailList[i])){
	    		count++;
	     		break;
	     	}
	    }//for
	    
	    if(count==0){
	    	isEtc = true;
	    }
    }
    
%>
<article>
<div class="divForm">
<form name="frm1" method="post" action="memberEdit_ok.jsp">
<fieldset>
	<legend>회원 정보 수정</legend>
    <div>        
        <span class="sp1">성명</span>
        <span><%=vo.getName() %></span>
    </div>
    <div>
        <span class="sp1">회원ID</span>
        <span><%=vo.getUserid() %></span>
    </div>
    <div>
        <label for="pwd">비밀번호</label>
        <input type="Password" name="pwd" id="pwd">
    </div>
    <div>
        <label for="pwd2">비밀번호 확인</label>
        <input type="Password" name="pwd2" id="pwd2">
    </div>
    <div>
        <label for="zipcode">주소</label>
        <input type="text" name="zipcode" id="zipcode" ReadOnly  
        	title="우편번호" class="width_80" value="<%=vo.getZipcode()%>">
        <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="address" ReadOnly title="주소"  class="width_350" value="<%=vo.getAddress()%>"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="addressDetail" title="상세주소"  class="width_350" value="<%=vo.getAddressDetail()%>">
    </div>
    <div>
        <label for="hp1">핸드폰</label>&nbsp;<select name="hp1" id="hp1" title="휴대폰 앞자리">
            <option value="010" <%if(hp1.equals("010")){%> selected="selected"<%} %>>010</option>
            <option value="011" <%if(hp1.equals("011")){%> selected="selected"<%} %>>011</option>
            <option value="016" <%if(hp1.equals("016")){%> selected="selected"<%} %>>016</option>
            <option value="017" <%if(hp1.equals("017")){%> selected="selected"<%} %>>017</option>
            <option value="018" <%if(hp1.equals("018")){%> selected="selected"<%} %>>018</option>
            <option value="019" <%if(hp1.equals("019")){%> selected="selected"<%} %>>019</option>
       	</select>
        -
        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
        	class="width_80" value="<%=hp2%>">-
        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
        	class="width_80" value="<%=hp3%>">
    </div>
    <div>
        <label for="email1">이메일 주소</label>
        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리"
        <%if(vo.getEmail()!=null && !vo.getEmail().isEmpty())%>
        value="<%=email1%>">@
        <select name="email2" id="email2"  title="이메일주소 뒷자리">
            <option value="naver.com" <%if(email2.equals("naver.com")){%> 
            	selected="selected"
            	<%} %>>naver.com</option>
            <option value="hanmail.net" <%if(email2.equals("hanmail.net")){%> 
            	selected="selected"
            	<%} %>>hanmail.net</option>
            <option value="nate.com" <%if(email2.equals("nate.com")){%> 
            	selected="selected"
            	<%} %>>nate.com</option>
            <option value="gmail.com" <%if(email2.equals("gmail.com")){%> 
            	selected="selected"
            	<%} %>>gmail.com</option>
            <option value="etc" <%if(isEtc){%> 
            	selected="selected"
            	<%} %>>직접입력</option>
        </select>
        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        	<%if(isEtc){ %>
	        	style="visibility:visible"
        		value="<%=email2%>"
        	<%}else{ %>
	        	style="visibility:hidden"
        	<%} %>
        	>
    </div>
    <div class="center">
         <input type="submit" id="wr_submit" value="수정">
    </div>
</fieldset>

</form>
</div>
</article>

<%@ include file="../inc/bottom.jsp"%>