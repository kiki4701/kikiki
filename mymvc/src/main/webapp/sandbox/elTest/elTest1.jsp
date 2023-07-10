<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elTest1.jsp</title>
</head>
<body>
<%
	//표현언어-EL : 기존의 jsp 표현식을 대체하는 효과
	//el 표현식에는 연산자 사용 가능, 내장객체 지원함
	//null에 관대하고 형변환도 자동으로 해줌
%>
<%-- <h1>el 표현식 연습</h1>
\${2+5 } : ${2+5 }<br>
\${10/3 } : ${10/3 }<br>
\${10%3 } : ${10%3 }<br>
\${header.host } : ${header.host }<br>
\${header["user-agent" } : ${header["user-agent" }<br>

<h2>기존 jsp 방식</h2>
<%
	String shost = request.getHeader("host");
	String sAgent = request.getHeader("user-agent");
%>
<hr>
<p>header host => <%=shost %></p>
<p>header user-agent => <%=sAgent %></p> --%>

<h1>el 표현식 연습</h1>
\${2+5 } : ${2+5 }<br>
\${10/3 } : ${10/3 }<br>
\${10%3 } : ${10%3 }<br>
\${header.host } : ${header.host }<br>
\${header["user-agent"] } : ${header["user-agent"] }<br>

<h2>기존 jsp 방식</h2>
<%
	String shost = request.getHeader("host");
	String sAgent = request.getHeader("user-agent");

%>
<hr>
<p>header host => <%=shost %> </p>
<p>header user-agent => <%=sAgent %> </p>


</body>
</html>