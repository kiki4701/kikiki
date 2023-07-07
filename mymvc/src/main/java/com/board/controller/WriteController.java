package com.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class WriteController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		  1. 글쓰기 화면 보여주기 (write.jsp) 
			 /board/write.do => DispatcherServlet => WriteController 
			 => write.jsp 로 forward
		 */	
		//1
		
		//2
		
		//3
		
		//4
		
		return "/board/write.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
