package com.study.groupware.serviceimpl;

import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.study.groupware.dao.AdminDAO;
import com.study.groupware.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	@Override
	public List officerList(Map param) throws Exception {
		return dao.officerList(param);
	}
	
	@Override
	public Map<String, Object> officerListCount(Map param) throws Exception {
		return dao.officerListCount(param);
	}

	@Override
	public List selectAdmn_Tb() throws Exception {
		return dao.selectAdmn_Tb();
	}

	@Override
	public List selectRnk_Tb() throws Exception {
		return dao.selectRnk_Tb();
	}

	@Override
	public List selectDpt_Div_Tb() throws Exception {
		return dao.selectDpt_Div_Tb();
	}
	
	
}
