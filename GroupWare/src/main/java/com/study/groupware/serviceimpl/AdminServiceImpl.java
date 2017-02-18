package com.study.groupware.serviceimpl;

import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.study.groupware.dao.AdminDAO;
import com.study.groupware.service.AdminService;
import com.study.groupware.vo.OfficerVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	@Override
	public List officerList(Map params) throws Exception {
		return dao.officerList(params);
	}
	
	@Override
	public Map<String, Object> officerListCount(Map params) throws Exception {
		return dao.officerListCount(params);
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
		
	@Override
	public int selectStf_Sq(Map params) throws Exception {
		return dao.selectStf_Sq(params);
	}

	@Override
	public void officerInsert(OfficerVO vo) throws Exception {
		dao.officerInsert(vo);
	}
}
