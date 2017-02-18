package com.study.groupware.service;

import java.util.List;
import java.util.Map;

import com.study.groupware.vo.OfficerVO;

public interface AdminService {
	public List officerList(Map params) throws Exception;
	public Map<String, Object> officerListCount(Map params) throws Exception;
	
	public List selectAdmn_Tb() throws Exception;
	public List selectRnk_Tb() throws Exception;
	public List selectDpt_Div_Tb() throws Exception;
	
	public int selectStf_Sq(Map params) throws Exception;
	public void officerInsert(OfficerVO vo) throws Exception;
	
}
