<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.herbmall.board.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.board.model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>자유게시판 글 목록 - 허브몰</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />

<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">	
	$(function () {
		$('.box2 tbody tr').hover(function () {
			$(this).css('background','yellow');
		},function(){
			$(this).css('background','');
		});
	})
</script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
</style>	
</head>	
<body>
<%
	//[1] write_ok.jsp 에서 글 등록 성공하는 경우 get방식으로 이동
	//[2] write.jsp, detail.jsp 에서 글 목록 버튼 누른 경우 get방식으로 이동
	//[3] 검색의 경우 - list.jsp에서 검색버튼 클릭하면 post방식으로 서브밋됨
	//[4]
			
	//1
	request.setCharacterEncoding("utf-8");
	String keyword=request.getParameter("searchKeyword");
	String condition=request.getParameter("searchCondition");

	//2. db작업
	BoardDAO boardDao = new BoardDAO();
	List<BoardVO> list = null;
	try{
		list = boardDao.selectAll(keyword, condition);
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3. 결과처리
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	if(keyword == null ) keyword="";
	
	
	
	//페이징 처리
	int currentPage=1;	//현재페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//[1] 현재 페이지와 무관한 변수
	int totalRecord=list.size();	//총 레코드 개수, 17
	int pageSize=5;	//한 페이지에 보여주는 레코드 수
	int blockSize=10;	//한 블럭에 보여줄 페이지 수
	int totalPage= (int)Math.ceil((float)totalRecord/pageSize);	//총 페이지 수, 4
	
	//[2] 현재 페이지를 이용해서 계산해야 하는 변수
	int firstPage = currentPage - ((currentPage-1)%blockSize);	//1,11,21.. 블럭의 시작페이지
	int lastPage= firstPage+(blockSize-1);	//10,20,30.. 블럭의 마지막 페이지
	
	//페이지당 ArrayList에서의 시작 index => 0, 5, 10, 15...
	int curPos = (currentPage-1)*pageSize;
	
	//페이지당 글 리스트 시작번호
	int num=totalRecord-curPos;
	
%>
<h2>자유게시판</h2>
<div class="divList">
	<%if(keyword !=null && !keyword.isEmpty()){%>
		<p>검색어 : <%=keyword%>, <%=totalRecord%>건 검색되었습니다.</p> 
	<%}%>
<table class="box2"
	 	summary="기본 게시판에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<caption>기본 게시판</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	    <th scope="col">조회수</th>
	  </tr>
	</thead> 
	<tbody>  
		<%if(list==null || list.isEmpty()){ %>
			<tr><td colspan="5" class="align_center">글이 존재하지 않습니다.</td></tr>
		<%}else{ %>
	  <!--게시판 내용 반복문 시작  -->	
	  <%
	  //5번씩만 반복
	  for(int i = 0; i<pageSize; i++) {
		  if(num<1) break;
			BoardVO vo = list.get(curPos++);
			num--;
		%>	
		<tr  style="text-align:center">
			<td><%=vo.getNo() %></td>
			<td style="text-align:left">
				<a href="countUpdate.jsp?no=<%=vo.getNo()%>"><%=vo.getTitle() %></a>
			</td>
			<td><%=vo.getName() %></td>
			<td><%=sdf.format(vo.getRegdate()) %></td>
			<td><%=vo.getReadcount() %></td>		
		</tr> 
		<%}//for  %>
	  <!--반복처리 끝  -->
	  <%}//if %>
	  </tbody>
</table>	   
</div>
<div class="divPage">
	<!-- 페이지 번호 추가 -->	
	<!-- 이전 블럭으로 이동 -->	
	<%if(firstPage>1){ %>
			<a href="list.jsp?currentPage=<%=firstPage-1%>">
				<img src="../images/first.JPG">
			</a>
	<%} %>	
			
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%for(int i=firstPage; i<= lastPage; i++){ 
		if(i>totalPage) break;
	
		if(i == currentPage){ %>
			<span style="color: blue;, font-weight: bold; font-size: 1em"><%=i%></span>
	<%	}else{	%>
			<a href="list.jsp?currentPage=<%=i%>
				&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>">[<%=i %>]</a>
	<%	}//if
		
	  }//for  %>
	
	<!-- 다음 블럭으로 이동 -->	
	<%if(lastPage< totalPage){ %>
			<a href="list.jsp?currentPage=<%=lastPage+1%>">
				<img src="../images/last.JPG">
			</a>
	<%} %>	
	
	<!--  페이지 번호 끝 -->
</div>
<div class="divSearch">
   	<form name="frmSearch" method="post" action='list.jsp'>
        <select name="searchCondition">
            <option value="title" 
            	<% if("title".equals(condition)){ %>
						selected="selected"
            	<% }  %>
            >제목</option>
            <option value="content"
            	<% if("content".equals(condition)){ %>
						selected="selected"
            	<% }  %>
            >내용</option>
            <option value="name"
            	<% if("name".equals(condition)){ %>
						selected="selected"
            	<% }  %>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력" 
        	value="<%=keyword%>">   
		<input type="submit" value="검색">
    </form>
</div>

<div class="divBtn">
    <a href='write.jsp' >글쓰기</a>
</div>

</body>
</html>

