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
//쿠키 생성하기 - 상태 정보를 저장하기 위한 방법 => 사용자의 pc에 임시파일로 저장됨, 최대 4kb 크기
//[1] 쿠키 객체 생성
Cookie ck = new Cookie("id","hong");

//[2] 유효기간 설정
ck.setMaxAge(2*60);	//초단위로 입력 => 120초 동안 쿠키가 유지됨

//[3] 쿠키 추가
response.addCookie(ck);

//두번쨰 쿠키 생성, 추가
Cookie ck2 = new Cookie("age","20");
ck2.setMaxAge(20*60);	//20분
response.addCookie(ck2);
%>

<h1>쿠키가 생성됨!</h1>
<a href="userCookie.jsp">쿠키 정보 읽기</a>

</body>
</html>