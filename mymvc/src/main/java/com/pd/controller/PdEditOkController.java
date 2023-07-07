package com.pd.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.pd.model.PdDTO;
import com.pd.model.PdService;

public class PdEditOkController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		  6. 상품 수정 처리 (기존 pdEdit_ok.jsp)
		  	/pd/pdEdit-ok.do => DispatcherServlet => PdEditOKController
				=> 	1) 메세지를 안 주는 경우 : pdDetail.do 로 redirect
					2) 메세지를 주는 경우 : message.jsp 로 forward
		 */
		//1. 파라미터 받기
		String no = request.getParameter("no");
		String pdName = request.getParameter("pdName");
		String price = request.getParameter("price");
		
		//2. db작업
		PdDTO dto = new PdDTO();
		dto.setNo(Integer.parseInt(no));
		dto.setPdName(pdName);
		dto.setPrice(Integer.parseInt(price));
		
		PdService pdService = new PdService();
		
		String msg = "상품 수정 실패", url = "/pd/pdEdit.do?no="+no;
		try {
			int cnt = pdService.updatePd(dto);
			if(cnt > 0) {
				msg = "상품 수정 성공";
				url = "/pd/pdDetail.do?no="+no;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		//3. 결과저장
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		//4. 뷰페이지
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
