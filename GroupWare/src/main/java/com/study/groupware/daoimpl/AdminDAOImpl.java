package com.study.groupware.daoimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.study.groupware.dao.AdminDAO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.study.groupware.adminMapper";

	@Override
	public List officerList(Map param) throws Exception {
		return session.selectList(namespace + ".officerList", param);
	}
	
	@Override
	public Map<String, Object> officerListCount(Map param) throws Exception {
		return session.selectOne(namespace + ".officerListCount", param);
	}

	@Override
	public List selectAdmn_Tb() throws Exception {
		return session.selectList(namespace + ".selectAdmn_Tb");
	}

	@Override
	public List selectRnk_Tb() throws Exception {
		return session.selectList(namespace + ".selectRnk_Tb");
	}

	@Override
	public List selectDpt_Div_Tb() throws Exception {
		return session.selectList(namespace + ".selectDpt_Div_Tb");
	}
	
	
}
