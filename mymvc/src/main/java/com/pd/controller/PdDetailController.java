package com.pd.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.pd.model.PdDTO;
import com.pd.model.PdService;

public class PdDetailController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		  4. 상품 상세보기 페이지 (pdDetail.jsp)
		  /pd/pdDetail.do => DispatcherServlet => PdDetailController
			=> pdDetail.jsp 로 forward	
		 */
		
		//1. 파라미터 받기
		String no = request.getParameter("no");
		
		if(no == null || no.isEmpty()) {
			request.setAttribute("msg", "잘못된 url입니다.");
			request.setAttribute("url", "/pd/pdList.do");
			
			return "/common/message.jsp";
		}
		
		//2. db 작업
		PdService pdService = new PdService();
		
		PdDTO dto = null;
		
		try {
			dto = pdService.selectByNo(Integer.parseInt(no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		//3. 결과 저장
		request.setAttribute("dto", dto);
		
		//4. 뷰페이지 반환
		return "/pd/pdDetail.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
