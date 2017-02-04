package com.study.groupware.daoimpl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.study.groupware.dao.ApprovalDAO;
import com.study.groupware.vo.ApprovalVO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "com.study.groupware.mapper.ApprovalMapper";

  @Override
  public void create(ApprovalVO vo) throws Exception {
    session.insert(namespace + ".create", vo);
  }

  @Override
  public ApprovalVO read(String apv_sq) throws Exception {
    return session.selectOne(namespace + ".read", apv_sq);
  }

  @Override
  public void update(ApprovalVO vo) throws Exception {
    session.update(namespace + ".update", vo);
  }

  @Override
  public void delete(String apv_sq) throws Exception {
    session.delete(namespace + ".delete", apv_sq);
  }

  @Override
  public List<ApprovalVO> listAll(String div_apv_sq) throws Exception {
    return session.selectList(namespace + ".listAll",div_apv_sq);
  }

  

}
