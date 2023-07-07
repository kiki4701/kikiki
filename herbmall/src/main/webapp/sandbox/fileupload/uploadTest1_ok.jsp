<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadTest1_ok.jsp</title>
</head>
<body>
<%
	//MultipartRequest 객체 생성 성공 => 업로드 완료
	//실패 => IOException 발생(파일 용량 초과 등)
	String upPath = "/upload";
	
	//업로드할 폴더의 절대경로 구하기
	String saveDir = config.getServletContext().getRealPath(upPath);
	System.out.println("saveDir = " + saveDir);
	
	saveDir = application.getRealPath(upPath);
	System.out.println("saveDir = " + saveDir);
	
	//테스트 하는 동안은 절대 경로 계속 들어가서 확인하기가 힘들어서 디렉토리 하나 테스트용으로 만들어놓은것. 
	saveDir = "D:\\lecture\\workspace_list\\jsp_ws\\herbmall\\src\\main\\webapp\\upload";
	System.out.println("test saveDir = " + saveDir);
	
	int maxSize = 2*1024*1024;	//2메가 => 업로드 최대용량 2메가로 제한
			
	//업로드시 동일한 파일명이 있을 경우 나중에 업로드한 파일에 번호를 붙여 구준해줌
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		
	try{
		MultipartRequest mr 
			=new MultipartRequest(request, saveDir, maxSize, "utf-8", policy);
		System.out.print("업로드 완료!\n");
		
		String id = request.getParameter("id");
		out.print("request - id : " + id + "<br>");
		
		id = mr.getParameter("id");
		out.print("mr - id : " + id + "<br>");
		String address = mr.getParameter("address");
		out.print("mr - address : " + address + "<br>");
		
		//업로드된 파일 정보
		String filename = mr.getFilesystemName("fileName");
		out.print("업로드 된 파일명(변경후) : " + filename + "<br>");
		
		String filename1 = mr.getOriginalFileName("fileName");
		out.print("업로드 된 파일명 원본 : " + filename1 + "<br>");
		
		File myFile = mr.getFile("fileName");
		out.print("file size : " + myFile.length() + "<br>");
	}catch(IOException e){
		System.out.println("2MB 이상의 파일은 업로드 할 수 없습니다!");
		e.printStackTrace();
	}
	
	
%>
</body>
</html>