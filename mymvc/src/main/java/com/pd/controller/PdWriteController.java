package com.pd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class PdWriteController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
	 	 1. pdWrite.jsp 화면 보여주기
			/pd/pdWrite.do => DispatcherServlet => PdWriteController 
			=> pdWrite.jsp 로 forward 
		 */
		
		String viewPage = "/pd/pdWrite.jsp";
		return viewPage;
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
