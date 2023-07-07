<%@page import="com.herbmall.common.Utility"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.reboard.model.ReBoardVO"%>
<%@page import="com.herbmall.reboard.model.ReBoardDAO"%>
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
	//write.jsp에서 [수정]버튼을 클릭하면 post방식으로 submit됨
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
		String no = multi.getParameter("no");	
		String oldFileName = multi.getParameter("oldFileName");
		
		//2
		ReBoardDAO reBoardDao = new ReBoardDAO();
		ReBoardVO vo = new ReBoardVO();
		
		vo.setNo(Integer.parseInt(no));
		vo.setTitle(title);
		vo.setName(name);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setContent(content);
		
		vo.setFileName(fileName);
	    vo.setFileSize(fileSize);
	    vo.setOriginalFileName(originFileName);
	
		if(reBoardDao.checkPwd(Integer.parseInt(no), pwd)){ //비밀번호가 일치하면 수정처리
		   	int cnt = reBoardDao.updateReBoard(vo);
		
			//3
			if(cnt>0){ 				
	            //새로운 파일을 첨부한 경우, 기존 파일이 있을 때만 기존파일을 삭제한다
	            if(fileName != null && !fileName.isEmpty()){
	               if(oldFileName != null && !oldFileName.isEmpty()){
	                  File myfile = new File(saveDir, oldFileName);
	                  if(myfile.exists()){
	                     boolean bool = myfile.delete();
	                     System.out.println("기존파일 삭제 : " + bool);
	                  }
	               }
	            }
			%>
				<script type="text/javascript">
					alert("글 수정되었습니다.");
					location.href="detail.jsp?no=<%=no%>";
				</script>	
		<%	}else{%>
				<script type="text/javascript">
					alert("글 수정 실패!");
					history.go(-1);
				</script>				
		<%	}
		}else{ //비밀번호 불일치 %>
			<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다.");
				history.go(-1);
			</script>	
	<%  }
	} catch (SQLException e) {
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



