package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	String requestProcess(HttpServletRequest request, HttpServletResponse response)
		throws Throwable;
	
	boolean isRedirect();
}
