<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadTest2_ok.jsp</title>
</head>
<body>
<%
	String upDir = "upload";
	//실제 물리적인 경로 구하기
	String saveDir = config.getServletContext().getRealPath(upDir);
	saveDir = application.getRealPath(upDir);
	System.out.println("업로드 경로 : " + saveDir);
	
	saveDir = "D:\\lecture\\workspace_list\\jsp_ws\\herbmall\\src\\main\\webapp\\upload";
	System.out.println("test 업로드 경로 : " + saveDir);
	
	int maxSize = 2*1024*1024; //2M
	String encoding = "utf-8";
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	//=> 동일한 이름이 있는 경우 이름 변경 abc.text => abc2.txt
	
	try{
		MultipartRequest mr 
			= new MultipartRequest(request, saveDir, maxSize, encoding, policy);
		//=> 파일 업로드 완료
	
		//업로드된 파일의 정보 읽어오기
		Enumeration fileNames = mr.getFileNames();
		//=> 여러개 파일을 업로드하는 경우 파일이름 목록을 리턴
		while(fileNames.hasMoreElements()){
			String fName = (String)fileNames.nextElement();
			//=> upfile1, upfile2, upfile3
					
			String fileName =mr.getFilesystemName(fName);
			//=> 업로드된 파일의 이름(변경된 파일 이름)
			String originalName = mr.getOriginalFileName(fName);
			//=> 변경전 원래 파일 이름
					
			File myfile = mr.getFile(fName);
			long fileSize=0;
			if(myfile!=null){
				fileSize=myfile.length();
			}
			out.println("업로드된 파일 이름: "+fileName+"<br>");
			out.println("원본 파일 이름: "+originalName+"<br>");
			out.println("파일사이즈: "+fileSize+"<br><br>");
		}//while
			
		//사용자가 입력한 요청 파라미터 읽어오기
		String id = request.getParameter("id");
	}catch(IOException e){
		System.out.println("2MB 이상의 파일은 업로드 할 수 없습니다!");
		e.printStackTrace();
	}

	
	
%>
</body>
</html>