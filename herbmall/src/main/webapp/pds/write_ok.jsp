<%@page import="com.herbmall.common.Utility"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.herbmall.reboard.model.ReBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.reboard.model.ReBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_ok.jsp</title>
</head>
<body>
	<%
	//write.jsp에서 등록 버튼을 누르면 post방식으로 서브밋 됨
	
	String upPath = Utility.UP_PATH;
	
	//업로드할 폴더의 절대경로 구하기
	String saveDir= config.getServletContext().getRealPath(upPath);
    saveDir=application.getRealPath(upPath);
	System.out.println("saveDir="+saveDir);
    
	saveDir=Utility.TEST_PATH;
	System.out.println("test saveDir="+saveDir);
	
	int maxSize=2*1024*1024; //2메가
	String encoding="utf-8";
	
	try{ 
		DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
		MultipartRequest multi 
		= new MultipartRequest(request, saveDir, maxSize, encoding, df);
		System.out.println("파일 업로드 완료!!");
	
		String fileName = multi.getFilesystemName("upfile");
		long fileSize=0;
		String originFileName=""; 
		if(fileName!=null){ //파일이 첨부된 경우만
			File myFile = multi.getFile("upfile");
			fileSize = myFile.length();
			
			originFileName=multi.getOriginalFileName("upfile");
		}
		
	    //1. 요청 파라미터 읽어오기    
	    String title = multi.getParameter("title");
	    String name = multi.getParameter("name");
	    String pwd = multi.getParameter("pwd");
	    String email = multi.getParameter("email");
	    String content = multi.getParameter("content");
		
	   	String ip=request.getRemoteAddr();
	   	String ip2=request.getRemoteHost();
	   	System.out.println("ip="+ip);
	   	System.out.println("ip2="+ip2);
	   	
	    //2. db작업
	    ReBoardDAO reBoardDao = new ReBoardDAO();
	    ReBoardVO vo = new ReBoardVO();
	    vo.setContent(content);
	    vo.setEmail(email);
	    vo.setName(name);
	    vo.setPwd(pwd);
	    vo.setTitle(title);
    
	    vo.setFileName(fileName);
	    vo.setFileSize(fileSize);
	    vo.setOriginalFileName(originFileName);
	    
    	int cnt=reBoardDao.insertReBoard(vo);
    	
	    //3. 결과처리
	    if(cnt>0){%>
	    	<script type="text/javascript">
	    		alert('글쓰기 처리되었습니다.');
	    		location.href="list.jsp";
	    	</script>
	    <%}else{%>
	    	<script type="text/javascript">
	    		alert('글쓰기 실패!');
	    		history.back();
	    	</script>	    	
	   <% }
    }catch(SQLException e){
    	e.printStackTrace();
    }catch(IOException e){
    	e.printStackTrace();
    	
    	String str = "<script>";
    	str += "alert('2M 이상의 파일은 업로드할 수 없습니다!');";
    	str += "history.back();</script>";
    	out.print(str);
    }
    
		
	%>
</body>
</html>





