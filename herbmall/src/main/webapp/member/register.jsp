<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript" src="../js/member.js"></script>

<script type="text/javascript">
	$(function () {
		$('#wr_submit').click(function () {
			if($('#name').val().length<1){
				alert('성명을 입력해주세요');
				$('#name').focus();
				//event.preventDefault();
				return false;
			}
			if($('#userid').val().length<1){
				alert('ID를 입력해주세요');
				$('#userid').focus();
				event.preventDefault();
				return;
			}
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
			
			if($('#chkId').val()!=='Y'){
				alert('아이디 중복확인을 해주세요');
				return false;
			}
		})
	})
</script>

<style type="text/css">
	.width_80{
		width:80px;
	}
	.width_350{
		width:350px;
	}	
</style>
<article>
<div class="divForm">
<form name="frm1" method="post" action="register_ok.jsp">
<fieldset>
	<legend>회원 가입</legend>
    <div>        
        <label for="name">성명</label>
        <input type="text" name="name" id="name" style="ime-mode:active">
    </div>
    <div>
        <label for="userid">회원ID</label>
        <input type="text" name="userid" id="userid"
        		style="ime-mode:inactive">&nbsp;
        <input type="button" value="중복확인" id="btnChkId" title="새창열림">
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
        	title="우편번호" class="width_80">
        <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="address" ReadOnly title="주소"  class="width_350"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="addressDetail" title="상세주소"  class="width_350">
    </div>
    <div>
        <label for="hp1">핸드폰</label>&nbsp;<select name="hp1" id="hp1" title="휴대폰 앞자리">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
       	</select>
        -
        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
        	class="width_80">-
        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
        	class="width_80">
    </div>
    <div>
        <label for="email1">이메일 주소</label>
        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리">@
        <select name="email2" id="email2"  title="이메일주소 뒷자리">
            <option value="naver.com">naver.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="nate.com">nate.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="etc">직접입력</option>
        </select>
        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        	style="visibility:hidden">
    </div>
    <div class="center">
         <input type="submit" id="wr_submit" value="회원가입">
    </div>
</fieldset>

    <input type ="text" name="chkId" id="chkId">
        
</form>
</div>
</article>

<%@ include file="../inc/bottom.jsp"%>











