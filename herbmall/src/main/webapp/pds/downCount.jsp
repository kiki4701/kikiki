<%@page import="com.herbmall.common.Utility"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="com.herbmall.reboard.model.ReBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>downCount.jsp</title>
</head>
<body>
<%  
	//[1] 다운로드 수 증가시키기
	int no = Integer.parseInt(request.getParameter("no"));
	String fileName = request.getParameter("fileName");

	ReBoardDAO dao = new ReBoardDAO();	 
	int n = dao.updateDownCount(no); 
	  
	//[2] 강제 다운로드 창 띄우기
	BufferedInputStream bis = null;
	BufferedOutputStream bos =null;
	try{
		String dirPath = application.getRealPath(Utility.UP_PATH);
		dirPath=Utility.TEST_PATH;
		
		File myfile = new File(dirPath, fileName);
		
		//page의 설정을 바꾸기 위해서 response를 다 날려버림
		response.reset();
		
		//setContentType는 MIME 타입을 지정-octet-stream으로 지정시, 형식을 지정하지 않겠다는 것
		response.setContentType("application/octet-stream");
		
		//브라우저 파일 확장자를 포함하여 모든 확장자의 파일들에 대해 다운로드시 무조건 파일다운로드 대화상자가 뜨도록 하는 헤더속성
		response.setHeader("Content-Disposition", "attachment;filename="
			+ new String(fileName.getBytes("euc-kr"),"ISO-8859-1")+"");
	
		//url 전송시 ISO-8859-1 로 인코딩되므로 한글 처리 위해 인코딩
		//파일이름을 인코딩한다.(euc-kr  => ISO-8859-1)   
			
		out.clear();
		out=pageContext.pushBody();
		//이를 생략하면 프로그램 상엔 이상이 없으나 이미 존재하고 있는 out객체로 바이트 기반의 스트림 작업을 명시하면서 오류가 발생함

		byte[] data = new byte[1024 * 1024];
		bis = new BufferedInputStream(new FileInputStream(myfile));
		bos = new BufferedOutputStream(response.getOutputStream());
		
		int count = 0;
		while((count = bis.read(data))!= -1){
		 	bos.write(data);
		}		
	}catch(Exception e){		
		e.printStackTrace();
	}finally{
		if(bis !=null) bis.close();
		if(bos != null) bos.close();
	}	
%>


</body>
</html>