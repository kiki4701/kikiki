package com.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/DispatcerServlet")
public class DispatcerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Properties props;
	
	//init() - 해당 서블릿이 요청될때 최초로 한번만 호출되는 메서드
	@Override
	public void init(ServletConfig config) throws ServletException {
		//매핑 파일을 읽어서 Properties 컬렉션에 저장한다
		
		//web.xml에서 <init-param>의 값 읽기 - CommandPro.properties 파일
		String configFile = config.getInitParameter("configFile");
		//=> /config/CommandPro.properties
		System.out.println("configFile = " + configFile);
		
		//매핑 파일의 실제 경로 구하기
		String realConfigFile = config.getServletContext().getRealPath(configFile);
		System.out.println("realConfigFile = " + realConfigFile + "\n");
		
		props = new Properties();
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(realConfigFile);
			props.load(fis); //CommandPro.properties 파일의 정보를 Properties 객체에 저장
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		requestPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		requestPro(request, response);
	}
	
	//사용자의 요청이 들어올때마다 호출됨
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		/*
		 매핑파일(Properties컬렉션)을 참고해서 직원 구해서 일시킨다
		 */
		
		/*
		  1. 사용자의 URI에서 명령어를 추출해서
		  2. 매핑파일에서 명령어에 해당하는 직원을 구해서, 직원에게 일시킨다(메서드 호출)
		  3. 결과(뷰페이지)를 리턴받아서 해당 뷰페이지로 포워드한다
		 */
		
		//한글 인코딩
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//1. 사용자의 URI 읽어오기 => /mymvc/tips/book.do
		String uri = request.getRequestURI();
		System.out.println("uri = " + uri);
		
		//2. URI에서 Context Path 제거해서 명령어만 추출하기
		String ctxPath = request.getContextPath();	//=> /mymvc
		System.out.println("contextPath = " + ctxPath);
		
		if(uri.indexOf(ctxPath) != -1) {
			uri = uri.substring(ctxPath.length()); //6부터 끝까지 추출 => /tips/book.do
		}
		System.out.println("ContextPath 제거 후 uri : " + uri);
		
		//	매핑파일 /tips/book.do = BookController2
		//	key:/tips/book.do, value = BookController2
		//3. properties 컬렉션에서 명령어에 해당하는 명령어 처리 클래스 구하기
		String commandVal = props.getProperty(uri);	//BookController2
		System.out.println("명령어 처리 클래스 : " + commandVal);
		
		try {
			//해당 문자열을 클래스로 만든다.
			Class commandClass = Class.forName(commandVal);

			//해당 클래스의 객체를 생성
			Controller controller = (Controller) commandClass.newInstance();
			
			//4. 명령어 처리 클래스의 메서드 호출
			String viewPage = controller.requestProcess(request, response);
			System.out.println("viewPage = " + viewPage);
			
			//5. 뷰 페이지로 포워드
			if(controller.isRedirect()) {
				System.out.println("redirect!\n");
				//redirect 일떄는 contextPath 가 자동으로 들어가지 않으므로 
				//여기서 redirect 일 경우 넣고 보내서 처리한다 
				response.sendRedirect(ctxPath + viewPage);
			}else {
				System.out.println("forward!\n");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		
	}

}
