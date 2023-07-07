package com.book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class BookWriteController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
	 	 1. bookWrite.jsp 화면 보여주기
			/book/bookWrite.do => DispatcherServlet => PdWriteController 
			=> bookWrite.jsp 로 forward 
		 */
		
		String viewPage = "/book/bookWrite.jsp";
		return viewPage;
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
