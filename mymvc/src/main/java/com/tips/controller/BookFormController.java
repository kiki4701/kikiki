package com.tips.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class BookFormController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String viewPage = "/tips/bookForm.jsp";
		return viewPage;
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
