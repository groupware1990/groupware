package com.study.groupware.daoimpl;

import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.study.groupware.dao.ScheduleDAO;
import com.study.groupware.vo.ScheduleVO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {
	@Inject
	private SqlSession session;

	private static String namespace = "com.study.groupware.mapper.ScheduleMapper";

	@Override
	public void create(ScheduleVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public ScheduleVO read(Map param) throws Exception {
		return session.selectOne(namespace + ".read", param);
	}

	@Override
	public void update(ScheduleVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int bs_scd_sq) throws Exception {
		session.delete(namespace + ".delete", bs_scd_sq);
	}

	@Override
	public List<ScheduleVO> listAll(int scd_sq) throws Exception {
		return session.selectList(namespace + ".listAll",scd_sq);
	}

	@Override                                                                                                  
	public List<ScheduleVO> sclist() throws Exception{
		return session.selectList(namespace + ".sclist");
	}

}
