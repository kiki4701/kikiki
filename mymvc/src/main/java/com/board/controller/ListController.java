package com.board.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardService;
import com.board.model.BoardVO;
import com.common.PagingVO;
import com.controller.Controller;

public class ListController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		 3. 글 목록 페이지  (list.jsp)
			/board/list.do => DispatcherServlet => ListController
			=> list.jsp로 forward
		*/
		//1
		String keyword=request.getParameter("searchKeyword");
		String condition=request.getParameter("searchCondition");
		
		//2
		BoardService service = new BoardService();
		List<BoardVO> list=null;
		
		try {
			list=service.selectAll(keyword, condition);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		//페이징 처리 관련
		int currentPage=1;
		if(request.getParameter("currentPage")!=null) {
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int totalRecord=list.size();
		int pageSize=BoardService.PAGE_SIZE;
		int blockSize=BoardService.BLOCK_SIZE;
		
		PagingVO pageVo = new PagingVO(currentPage,totalRecord,pageSize,blockSize);
		
		//3
		request.setAttribute("list", list);
		request.setAttribute("pageVo", pageVo);
		
		//4
		return "/board/list.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}