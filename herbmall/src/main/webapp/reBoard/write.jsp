<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.reboard.model.ReBoardVO"%>
<%@page import="com.herbmall.reboard.model.ReBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />

<%
	//[1] 글쓰기 - list.jsp에서 [글쓰기]링크 클릭하면 get방식으로 이동
	//[2] 글수정 - detail.jsp에서 [수정]링크 클릭하면 get방식으로 이동
	//=> 파라미터 no가 있는 경우는 글수정
	
	//1
	String no=request.getParameter("no");
	boolean isEdit=false;
	String pageTitle="", btLabel="";
	if(no!=null && !no.isEmpty()){
		isEdit=true;  //글수정
		
		pageTitle="글 수정";
		btLabel="수정";
	}else{  //글쓰기
		pageTitle="글쓰기";
		btLabel="등록";		
	}	
	
	//2
	//글수정인 경우만 db에서 데이터 조회해서 출력해준다
	ReBoardVO vo=new ReBoardVO();
	if(isEdit){
		ReBoardDAO reBoardDao = new ReBoardDAO();
		
		try{
			vo=reBoardDao.selectByNo(Integer.parseInt(no));
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	String title=vo.getTitle();
	String name=vo.getName();
	String email=vo.getEmail();
	String content=vo.getContent();
	
	if(title==null) title="";
	if(name==null) name="";
	if(email==null) email="";
	if(content==null) content="";
	
%>

<title>답변형게시판 <%=pageTitle %> - 허브몰</title>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
        $('#title').focus();
		
		$('input[type=button]').click(function(){
			location.href	='list.jsp';
		});
		
		$('input[type=submit]').click(function(){
		   $('.infobox').each(function(idx, item){
		      if($(this).val().length <1){
		         alert($(this).prev().text() + '를 입력하세요');
		         $(this).focus();
		         event.preventDefault();
		         return false;
		      }
		   });
		   
		});
	});
</script>

</head>
<body>
<div class="divForm">
<form name="frmWrite" method="post" 
	<%if(!isEdit){%>
		action="write_ok.jsp"
	<%	}else{%>
		action="edit_ok.jsp"	
	<%	}	%>  >
 <fieldset> 
	<legend><%=pageTitle %></legend>
		<!-- 수정 처리시 no가 필요하므로 hidden 필드에 넣어서 보내준다 -->
		<input type="text" name="no" value="<%=no%>">
		
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" class="infobox" 
            	value="<%=title%>"/>
        </div>
        <div>
            <label for="name">작성자</label>
            <input type="text" id="name" name="name" class="infobox" 
            	value="<%=name%>"/>
        </div>
        <div>
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" class="infobox" />
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" value="<%=email%>"/>
        </div>
        <div>  
        	<label for="content">내용</label>        
 			<textarea id="content" name="content" rows="12" cols="40"><%=content%></textarea>
        </div>
        <div class="center">
            <input type = "submit" value="<%=btLabel %>"/>
            <input type = "Button" value="글목록" />         
        </div>
    </fieldset>
</form>
</div>   

              
</body>
</html>