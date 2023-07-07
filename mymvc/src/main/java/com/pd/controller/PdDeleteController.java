package com.pd.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.pd.model.PdService;

public class PdDeleteController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		  7. 상품 삭제 처리 (기존 delete.jsp)
			/pd/pdDelete.do => DispatcherServlet => PdDeleteController
			=> pdList.do 로 redirect
		 */
	
		//1. 파라미터 받기
		String no = request.getParameter("no");
		
		//2. db처리
		PdService pdService = new PdService();
		try {
			int cnt = pdService.deletePd(Integer.parseInt(no));
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		//3. 결과저장
		//4. 뷰페이지
		return "/pd/pdList.do";
	}

	@Override
	public boolean isRedirect() {
		return true;
	}

}
