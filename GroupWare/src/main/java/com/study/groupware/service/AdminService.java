package com.study.groupware.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	public List officerList(Map param) throws Exception;
	public Map<String, Object> officerListCount(Map param) throws Exception;
	
	public List selectAdmn_Tb() throws Exception;
	public List selectRnk_Tb() throws Exception;
	public List selectDpt_Div_Tb() throws Exception;
}
