package com.pd.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.pd.model.PdDTO;
import com.pd.model.PdService;

public class PdEditController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		 	5. 상품 수정 페이지 - 화면 (pdEdit.jsp)
		 		/pd/pdEdit.do => DispatcherServlet => PdEditController
				=> pdEdit.jsp 로 forward
		 */
		//1
		String no = request.getParameter("no");
		
		if(no == null || no.isEmpty()) {
			request.setAttribute("msg", "잘못된 url 입니다");
			request.setAttribute("url", "/pd/pdList.do");
			
			return "/common/message.jsp";
		}
		
		//2 db
		PdService pdService = new PdService();
		PdDTO dto = null;
		
		try {
			dto = pdService.selectByNo(Integer.parseInt(no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		//3 결과저장
		request.setAttribute("dto", dto);
		
		//4 뷰페이지
		String viewPage = "/pd/pdEdit.jsp";
		return viewPage;
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
