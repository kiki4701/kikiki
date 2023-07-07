package com.pd.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.pd.model.PdDTO;
import com.pd.model.PdService;

public class PdListController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		  3. 상품 목록 페이지(pdList.jsp)
		  	/pd/pdList.do => DispatcherServlet => PdListController  
			=> pdList.jsp 로 forward
		 */
		
		//1. 파라미터 받기
		//2. db작업
		PdService pdService = new PdService();
		
		List<PdDTO> list = null;
		
		try {
			list = pdService.selectAll();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		//3. 결과 저장
		request.setAttribute("list", list);
		
		//4. 뷰페이지 리턴
		String viewPage = "/pd/pdList.jsp";
		return viewPage;
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
