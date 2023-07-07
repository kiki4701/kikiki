package com.pd.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.pd.model.PdDTO;
import com.pd.model.PdService;

public class PdWriteOkController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		  2. 상품 등록(insert)라는 페이지(기존 pdWrite_ok.jsp)
		  	/pd/pdWrite_ok.do => DispatcherServlet => pdWriteOkController
			=> pdList.do redirect 
		 */
		
		//1. 파라미터 읽어오기
		String pdName = request.getParameter("pdName");
		String price = request.getParameter("price");
		
		//2. 
		PdDTO dto = new PdDTO();
		dto.setPdName(pdName);
		dto.setPrice(Integer.parseInt(price));
		
		PdService pdService = new PdService();
		
		try {
			int cnt = pdService.insertPd(dto);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		//3. 결과 저장
		
		//4. 웹페이지 리턴
		return "/pd/pdList.do";
	}

	@Override
	public boolean isRedirect() {
		return true;	//redirect
	}
	
}
