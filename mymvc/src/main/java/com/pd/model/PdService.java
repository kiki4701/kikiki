package com.pd.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.db.ConnectionPoolMgr2;

public class PdService {
	private PdDAO pdDao;
	
	public PdService(){
		pdDao = new PdDAO();
	}
	
	public int insertPd(PdDTO dto) throws SQLException {
		return pdDao.insertPd(dto);
	}
	
	public List<PdDTO> selectAll() throws SQLException {
		return pdDao.selectAll();
	}
	
	public PdDTO selectByNo(int no) throws SQLException {
		return pdDao.selectByNo(no);
	}

	public int updatePd(PdDTO dto) throws SQLException {
		return pdDao.updatePd(dto);
	}
	
	public int deletePd(int no) throws SQLException {
		return pdDao.deletePd(no);
	}
	
}
